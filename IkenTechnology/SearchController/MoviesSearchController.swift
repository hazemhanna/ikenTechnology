//
//  aaa.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//


import UIKit
import RealmSwift

class MoviesSearchController  : UICollectionViewController , UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    var cell = "cell"
    var cell2 = "cell2"
    var Headers = "Headers"
    var prsenter : MainPresenterProtocol?
    //// api array
    var Allmovies = [ResultViewModel]()
    //// search array
    var myMovies:Results<MoviesModel>!
    var searchKey : String?
    
    var selectedindex = 0
    func selectLayout(id : Int){
        selectedindex = id
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if selectedindex == 0 {
            return Allmovies.count
        }else{
            return myMovies.count
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if selectedindex == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! AllMoviesCell
            cell.Allmovies = Allmovies[indexPath.item]
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell2, for: indexPath) as! SearcView
            cell.namelabel.text = myMovies[indexPath.item].title
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if selectedindex == 0 {
            return CGSize(width:collectionView.frame.width , height: collectionView.frame.height * 0.25)
        }else{
            return CGSize(width:collectionView.frame.width , height: collectionView.frame.height * 0.1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: self.Headers, for: indexPath as IndexPath) as! SectionHeader
            header.prsenter = prsenter
            header.controller = self
            if selectedindex == 1 {
            }
            return header
        default:
            fatalError("Unexpected element kind")
        }
    }
    
    /////// give header size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height  * 0.05)
    }
    
    
    //// select item
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedindex == 0 {
            let featuredAppsController = MovieDetails()
            featuredAppsController.Allmovies = Allmovies[indexPath.item]
            self.navigationController?.pushViewController(featuredAppsController, animated: true)
        }else{
            searchKey = myMovies[indexPath.item].title
            prsenter?.getMoview(name : searchKey! ,page : 1,completion: { (data) in
                if data.count > 0 {
                    self.Allmovies = data
                    self.collectionView?.reloadData()
                }else{
                    let errorAlert = UIAlertController(title: "Oops!", message: "this movie not Exist", preferredStyle: .alert)
                    let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                        errorAlert.dismiss(animated: true, completion: nil)
                    })
                    errorAlert.addAction(okayBtn)
                    self.present(errorAlert, animated: true, completion: nil)
                }
            })
            self.selectLayout(id: 0)
        }
    }
    
    
    
    
    
    ////// get new movies (support pagination)
    var page = 1
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let topVisibleIndexPath:IndexPath = (self.collectionView!.indexPathsForVisibleItems.first)!
        print(topVisibleIndexPath[1])
        if topVisibleIndexPath[1] >= Allmovies.count-6 {
            page = page + 1
            prsenter?.getMoview(name: searchKey!, page: page, completion: { (data) in
                for smallposts in data {
                    self.Allmovies.append(smallposts)
                }
                self.collectionView?.reloadData()
            })
        }
    }
    
    
    
    override func viewDidLoad() {
        self.prsenter = MainRouter.createModule()
        let realm = RealmService.shared.realm
        myMovies  = realm.objects(MoviesModel.self)
        
        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.backgroundColor = UIColor.black
        collectionView?.register(AllMoviesCell.self, forCellWithReuseIdentifier: cell)
        collectionView?.register(SearcView.self, forCellWithReuseIdentifier: cell2)
        
        collectionView?.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Headers)
        
        collectionView?.isScrollEnabled = true
        
        var titleLabel = UILabel()
        titleLabel = UILabel(frame: CGRect(x:view.frame.width/2, y: 20, width:view.frame.width, height: view.frame.height))
        titleLabel.text = NSLocalizedString("Now Playing", comment: "this is name")
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.barTintColor = UIColor.black
        
    }
    
}


