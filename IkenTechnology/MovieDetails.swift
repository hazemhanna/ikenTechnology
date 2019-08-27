//
//  aaaaa.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//



import UIKit
class MovieDetails  : UIViewController {
    
    var Allmovies : ResultViewModel?{
        didSet{
            datelabe.text = Allmovies?.releaseDate
            logoImage.loadImageUsingUrlString((Allmovies?.posterPath)!)
            overViewLabel.text = Allmovies?.overview
            titleLabel.text = Allmovies?.title
        }
    }
    
    override func viewDidLoad() {
        
        
        navigationItem.title = "\(Allmovies!.title)"
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        view.backgroundColor = UIColor.rgb(252, green: 244, blue: 246)
        ////////// profile image
        view.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor ).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        logoImage.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.3).isActive = true
        
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor,constant : 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: logoImage.leftAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier : 0.4).isActive = true
        titleLabel.numberOfLines = 2
        
        view.addSubview(datelabe)
        datelabe.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant : 10).isActive = true
        datelabe.leftAnchor.constraint(equalTo: logoImage.leftAnchor).isActive = true
        
        
        
        view.addSubview(overViewLabel)
        overViewLabel.topAnchor.constraint(equalTo: datelabe.bottomAnchor,constant : 10).isActive = true
        overViewLabel.leftAnchor.constraint(equalTo: logoImage.leftAnchor).isActive = true
        overViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier : 0.8).isActive = true
        overViewLabel.numberOfLines = 8
        
        
        
    }
    
    
    /////////  view for logo image
    let  logoImage : CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "62403918_446799619437527_873018546056069120_o"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci as! CustomImageView
    }()
    
    let titleLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.black
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("aladine", comment: "this is name")
        return pl
    }()
    
    let datelabe :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.black
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("11/1/2019", comment: "this is name")
        return pl
    }()
    
    let overViewLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.black
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("asd asdfg fggklfkn klfekflfjk  hhef f he wffjb jfe efbbfkjewbfj wb  bjebfjwj jfbfwbfjwbj bwjbfjwb  ddbjkbjk bjkbfjkb fkfbfbjb kfjfbew jfbjkfbfb jbjebfewbfewjb fjkfjbewj fkj bfjkefewjfb  ewbfewfbj  bjfewb fewf  f f fjf ", comment: "this is name")
        return pl
    }()
    
    
}
