//
//  File.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit
protocol MainInteractorProtocol {
    
    // func getMoview(parameters: [String: String],completion : @escaping (ResultObject) -> Void)
    func getMoview(name: String ,page :Int ,completion : @escaping (ResultObject) -> Void )
    
}

class MainInteractor : MainInteractorProtocol {
    
    func getMoview(name: String ,page :Int ,completion : @escaping (ResultObject) -> Void ){
        
        let urlString = "http://api.themoviedb.org/3/search/movie?api_key=b3070a5d3abfb7c241d2688d066914e7&query=\(name)&page=\(page)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url: URL = URL(string:urlString ?? "")!
        print(url)
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            do {
                print(data)
                let Store  = try JSONDecoder().decode(ResultObject.self, from: data!)
                DispatchQueue.main.async (execute: {
                    completion(Store)
                })
            } catch let jsonErr {
                print(jsonErr)
            }
        }
        
        task.resume()
        
    }
    
    //
    //    func getMoview(parameters: [String: String],completion : @escaping (ResultObject) -> Void) {
    //        var components = URLComponents(string: "http://api.themoviedb.org/3/search/movie?")!
    //        components.queryItems = parameters.map { (key, value) in
    //            URLQueryItem(name: key, value: value)
    //        }
    //       components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: " ", with: "%20")
    //        let request = URLRequest(url: components.url!)
    //        print(request)
    //        let task = URLSession.shared.dataTask(with: request) { data, response, error in
    //            do {
    //                let Store  = try JSONDecoder().decode(ResultObject.self, from: data!)
    //                DispatchQueue.main.async (execute: {
    //                    completion(Store)
    //                })
    //            } catch let jsonErr {
    //                print(jsonErr)
    //            }
    //
    //
    //        }
    //        task.resume()
    //    }
    
    
}
