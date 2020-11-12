import Foundation
import Alamofire


let bffBaseURL = "https://api.openweathermap.org/data/2.5/weather"


protocol Requestable {
    associatedtype ResponseType: Codable
    
    var endpoint: String { get }
    var method: Network.Method { get }
    var baseUrl: URL { get }
}

extension Requestable {
    var baseUrl: URL {
        return URL(string: bffBaseURL)!
    }
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

class Network: NetworkProtocol {
    var shouldForceRefreshToken: Bool = false
    private var sessionManager = SessionManager()
    public enum Method: String {
        case get = "GET"
    }
    
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func request<T: Requestable>(
        req: T,
        completionHandler: @escaping (Result<T.ResponseType>) -> Void
    ) {
        let url = req.baseUrl.appendingPathComponent(req.endpoint)
        let request = prepareRequest(for: url, req: req)
        
            self.sessionManager.request(request)
                .validate(statusCode: 200..<299)
                .responseData { [weak self] (response) in
                    guard let strongSelf = self else { return }
                    
                    if response.result.isFailure == true {
                        let error = AppError.networkError(
                            status: response.response?.statusCode ?? 0,
                            description:"Unknown"
                        )
                        completionHandler(Result.failure(error))
                        return
                    }
                    
                    guard let data = response.data else {
                        completionHandler(
                            .failure(
                                AppError.dataError(
                                    description: "Response is empty"
                                )
                            )
                        )
                        return
                    }
                    
                    do {
                        let object = try strongSelf.decoder
                            .decode(
                                T.ResponseType.self,
                                from: data
                        )
                        completionHandler(.success(object))
                    } catch let error {
                        completionHandler(.failure(error))
                    }
            }
    }
}

extension Network {
    private func prepareRequest<T: Requestable>(for url: URL, req: T) -> URLRequest {
        
        switch req.method {
        case .get:
            var request = URLRequest(url: url)
            let components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            request = URLRequest(url: components.url!)
            request.httpMethod = req.method.rawValue
            request.timeoutInterval = 25
            return request
        }
    }
}
