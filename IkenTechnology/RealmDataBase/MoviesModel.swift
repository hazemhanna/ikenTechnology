//
//  asdf.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class  MoviesModel : Object {
    
    @objc dynamic var title  : String = ""
    
    convenience init( title : String ) {
        self.init()
        self.title = title
    }
    
}
