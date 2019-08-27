//
//  ddd.swift
//  IkenTechnology
//
//  Created by MAC on 8/27/19.
//  Copyright © 2019 MAC. All rights reserved.
//



import Foundation
struct ResultViewModel {
    let title: String
    let posterPath: String?
    let originalTitle: String
    let overview, releaseDate: String
    
    init(movie : Result) {
        self.title = movie.title
        if let path = movie.posterPath {
            self.posterPath = "https://image.tmdb.org/t/p/w500\(path)"
        }else{
            self.posterPath = nil
        }
        self.originalTitle = movie.originalTitle
        self.overview = movie.overview
        self.releaseDate = movie.releaseDate
    }
    
}

