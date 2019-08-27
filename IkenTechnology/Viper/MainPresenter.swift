//
//  aa.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//




import UIKit

protocol MainPresenterProtocol {
    
    func getMoview(name: String ,page :Int ,completion : @escaping ([ResultViewModel]) -> Void )
}

class MainPresenter: MainPresenterProtocol {
    
    let interactor: MainInteractorProtocol
    let router: MainRouterProtocol
    
    init(interactor: MainInteractorProtocol, router: MainRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    
    func getMoview(name: String ,page :Int ,completion : @escaping ([ResultViewModel]) -> Void )
    {
        interactor.getMoview(name: name ,page :page) { (data) in
            completion(self.movieViewModel(from: data))
        }
    }
    
    private func movieViewModel(from cat: ResultObject) -> [ResultViewModel] {
        return cat.results.map({return ResultViewModel(movie: $0)}) ?? []
    }
}
