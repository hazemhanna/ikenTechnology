//
//  asdf.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit
class SearcView: BaseCell {
    override func setupViews() {
        addSubview(namelabel)
        namelabel.leftAnchor.constraint(equalTo: leftAnchor,constant : 15).isActive = true
        namelabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    let namelabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        var font = UIFont(name: "DroidArabicNaskh", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("fast and furious", comment: "this is name")
        return pl
        
    }()
    
    
}




