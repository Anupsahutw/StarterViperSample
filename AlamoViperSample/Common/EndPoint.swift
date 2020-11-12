//
//  EndPoint.swift
//  AlamoViperSample
//
//  Created by Anup.Sahu on 12/11/20.
//  Copyright © 2020 Anup.Sahu. All rights reserved.
//

import Foundation

struct Endpoint: Requestable {
        
    typealias ResponseType = PostModel
    
    
    var baseUrl: URL {
        return URL(string: bffBaseURL)!
    }
    
    var endpoint: String {
        return "?lat=\(12.9716)&lon=\(77.5946)&appid=66ca84031a262702991f8c38622e7f9a&units=metric"
    }
    
    var method: Network.Method {
        return .get
    }
}

