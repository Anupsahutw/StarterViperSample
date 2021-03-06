//
//  GetListInteractor.swift
//  AlamoViperSample
//
//  Created by Anup.Sahu on 12/11/20.
//  Copyright © 2020 Anup.Sahu. All rights reserved.
//

import Foundation
import Alamofire

class GetListInteractor: PostListInteractorInputProtocol {
    
    var presenter: PostListInteractorOutputProtocol?
    
    var remoteDatamanager: PostListRemoteDataManagerInputProtocol?
    
    func retrievePostList() {
        
    }
}

extension GetListInteractor: PostListRemoteDataManagerOutputProtocol {
    func onPostsRetrieved(_ posts: PostModel) {
        
    }
    
    func onError() {
        
    }
}
