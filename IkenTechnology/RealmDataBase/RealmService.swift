//
//  asd.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import RealmSwift
class RealmService {
    
    private init(){}
    static let shared = RealmService()
    
    var realm  = try! Realm()
    func create<T: Object> (_ object : T ){
        do{
            try realm.write {
                realm.add(object)
            }
        }catch{
            post(error)
        }
    }
    
    func post (_ error : Error){
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func observRealmError( in vc : UIViewController , compltion: @escaping (Error?) -> Void ){
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"), object: nil, queue: nil) { (notification) in
            compltion(notification.object as? Error)
        }
    }
    
    func stopObservingErrors( in vc : UIViewController){
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }
}
