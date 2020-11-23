//
//  GetListPresenter.swift
//  AlamoViperSample
//
//  Created by Anup.Sahu on 13/11/20.
//  Copyright © 2020 Anup.Sahu. All rights reserved.
//

import Foundation

class GetListPresenter: PostListPresenterProtocol {
    var view: PostListViewProtocol?
    
    var interactor: PostListInteractorInputProtocol?
    
    var wireFrame: PostListWireFrameProtocol?
    
    func viewDidLoad() {
        
    }
    
    func showPostDetail(forPost post: PostModel) {
       
    }
}

extension GetListPresenter: PostListInteractorOutputProtocol {
    func didRetrievePosts(_ posts: PostModel) {
        
    }
    
    func onError() {
        
    }
}
