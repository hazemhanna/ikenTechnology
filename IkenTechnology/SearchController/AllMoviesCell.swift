//
//  sssss.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit

class AllMoviesCell : BaseCell  {
    
    var Allmovies :ResultViewModel?{
        didSet{
            datelabe.text = Allmovies?.releaseDate
            if let imagePath = Allmovies?.posterPath {
                posterImage.loadImageUsingUrlString(imagePath)
            }
            overViewLabel.text = Allmovies?.overview
            titleLabel.text = Allmovies?.title
        }
    }
    
    override func setupViews(){
        backgroundColor = UIColor.clear
        addSubview(posterImage)
        posterImage.leftAnchor.constraint(equalTo: leftAnchor,constant : 5).isActive = true
        posterImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        posterImage.widthAnchor.constraint(equalTo: widthAnchor,multiplier : 0.3).isActive = true
        posterImage.heightAnchor.constraint(equalTo:heightAnchor,multiplier : 0.9).isActive = true
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: posterImage.topAnchor,constant : 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: posterImage.rightAnchor,constant : 5).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor,multiplier : 0.3).isActive = true
        titleLabel.numberOfLines = 2
        
        addSubview(datelabe)
        datelabe.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant : 20).isActive = true
        datelabe.leftAnchor.constraint(equalTo: posterImage.rightAnchor,constant : 5).isActive = true
        
        addSubview(overViewLabel)
        overViewLabel.topAnchor.constraint(equalTo: datelabe.bottomAnchor,constant : 20).isActive = true
        overViewLabel.leftAnchor.constraint(equalTo: posterImage.rightAnchor,constant : 5).isActive = true
        overViewLabel.widthAnchor.constraint(equalTo: widthAnchor,multiplier : 0.5).isActive = true
        overViewLabel.numberOfLines = 3
        
        addSubview(lineView)
        lineView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        lineView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lineView.widthAnchor.constraint(equalTo: widthAnchor,multiplier : 0.8).isActive = true
        lineView.heightAnchor.constraint(equalToConstant : 0.5).isActive = true
        
    }
    
    lazy var posterImage :CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "62403918_446799619437527_873018546056069120_o"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
    let titleLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.yellow
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("aladine", comment: "this is name")
        return pl
    }()
    
    let datelabe :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("11/1/2019", comment: "this is name")
        return pl
    }()
    
    let overViewLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.white
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("asd asdfg fggklfkn klfekflfjk  hhef f he wffjb jfe efbbfkjewbfj wb  bjebfjwj jfbfwbfjwbj bwjbfjwb  ddbjkbjk bjkbfjkb fkfbfbjb kfjfbew jfbjkfbfb jbjebfewbfewjb fjkfjbewj fkj bfjkefewjfb  ewbfewfbj  bjfewb fewf  f f fjf ", comment: "this is name")
        return pl
    }()
    
    let  lineView  :UIView = {
        let ci = UIView()
        ci.backgroundColor = UIColor.white
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
}

