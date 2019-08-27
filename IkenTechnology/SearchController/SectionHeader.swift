//
//  ssssdf.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//



import UIKit

class SectionHeader : BaseCell, UITextFieldDelegate{
    
    var prsenter : MainPresenterProtocol?
    var  controller :  MoviesSearchController?
    
    override func setupViews() {
        //////// search for movie
        addSubview(searchTF)
        searchTF.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        searchTF.leftAnchor.constraint(equalTo: leftAnchor, constant : 10).isActive = true
        searchTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        searchTF.heightAnchor.constraint(equalTo:heightAnchor, multiplier: 0.9).isActive = true
        searchTF.textAlignment = .center
        searchTF.delegate = self
        
        addSubview(searchButn)
        searchButn.centerYAnchor.constraint(equalTo: searchTF.centerYAnchor).isActive = true
        searchButn.leftAnchor.constraint(equalTo: searchTF.rightAnchor, constant : 10).isActive = true
        searchButn.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2).isActive = true
        searchButn.heightAnchor.constraint(equalTo:heightAnchor, multiplier: 0.9).isActive = true
        searchButn.titleLabel?.textAlignment = .center
        
        searchTF.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToSearchPage)))
        searchTF.isUserInteractionEnabled = true
    
    }
    
    @objc func goToSearchPage(textField : UITextField){
        if controller?.selectedindex == 0 {
            controller?.selectLayout(id: 1)
            self.searchTF.text = ""
        }else{
            self.searchTF.becomeFirstResponder()
            self.searchTF.text = ""

        }
    }
    
    let searchTF :UITextField = {
        let tf = UITextField()
        tf.textColor = UIColor.black
        tf.attributedPlaceholder = NSAttributedString(string:NSLocalizedString("type your movie", comment: "this is name"),
                                                      
                                                      attributes:[NSAttributedString.Key.foregroundColor: UIColor.black])
        tf.backgroundColor = UIColor.white
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.cornerRadius = 15
        return tf
    }()
    
    lazy var searchButn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.setTitle(NSLocalizedString("search", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)  ///// how to give it black color and font
        var font = UIFont(name: "JFFlat-Regular", size: 14)
        button.titleLabel?.font = font
        return button
    }()
    
    @objc  func handlePrev() {
        controller?.selectLayout(id: 0)
        if searchTF.text != "" {
            ///// to save title in database
            let newMovie = MoviesModel(title: searchTF.text!)
            RealmService.shared.create(newMovie)
            //// get movies from api
            prsenter?.getMoview(name :searchTF.text!,page : 1,completion: { (data) in
                if data.count > 0 {
                    self.controller?.Allmovies = data
                    self.controller?.collectionView?.reloadData()
                    self.controller?.searchKey = self.searchTF.text!
                }else{
                    let errorAlert = UIAlertController(title: "Oops!", message: "this movie not Exist", preferredStyle: .alert)
                    let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                        errorAlert.dismiss(animated: true, completion: nil)
                    })
                    errorAlert.addAction(okayBtn)
                    self.controller?.present(errorAlert, animated: true, completion: nil)
                }
            })
        }else{
            let errorAlert = UIAlertController(title: "Oops!", message: "type movie plz", preferredStyle: .alert)
            let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                errorAlert.dismiss(animated: true, completion: nil)
            })
            errorAlert.addAction(okayBtn)
            controller?.present(errorAlert, animated: true, completion: nil)
        }
    }
    
}
