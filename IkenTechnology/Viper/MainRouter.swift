//
//  aa.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit

protocol MainRouterProtocol {
    
}

class MainRouter: MainRouterProtocol {
    
    
    let presentingViewController: UIViewController
    var window: UIWindow?
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
    
    static func createModule() -> MainPresenterProtocol {
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController =  MoviesSearchController(collectionViewLayout:layout)
        let interactor: MainInteractorProtocol = MainInteractor()
        let router:MainRouterProtocol = MainRouter(presentingViewController: featuredAppsController)
        let presenter: MainPresenterProtocol  = MainPresenter(interactor: interactor, router: router)
        return presenter
    }
}
