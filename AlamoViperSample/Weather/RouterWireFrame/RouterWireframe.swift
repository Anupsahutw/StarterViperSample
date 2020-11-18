//
//  RouterWireframe.swift
//  AlamoViperSample
//
//  Created by Anup.Sahu on 13/11/20.
//  Copyright © 2020 Anup.Sahu. All rights reserved.
//

import Foundation
import UIKit

class GetListWireFrame: PostListWireFrameProtocol {
    static func createGetListModule() -> UIViewController {
       let navController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationController")
        if let view = navController.children.first as? WeatherViewController {
               
                return navController
            }
            return UIViewController()
        }
        
        static var mainStoryboard: UIStoryboard {
            return UIStoryboard(name: "Main", bundle: Bundle.main)
        }
        
    
    func presentGetDetailScreen(from view: PostListViewProtocol, forPost post: PostModel) {
        //
    }
    
}
