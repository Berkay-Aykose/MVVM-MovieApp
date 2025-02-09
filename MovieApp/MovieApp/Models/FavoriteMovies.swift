//
//  FavoriteMovies.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 2.02.2025.
//

import Foundation

struct FavoriteMovies: Codable, Identifiable{
    
    let id : String
    let title : String
    let poster_path : String
    let adult : Bool
    let overview : String

}
