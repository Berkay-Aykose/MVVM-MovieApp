//
//  MovieDetail.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 2.02.2025.
//

import Foundation

struct MovieDetail : Codable {
    let adult : Bool?
    let backdrop_path : String?
    let belongs_to_collection : String?
    let budget : Int?
    let genres : [Genres]?
    let homepage : String?
    let id : Int?
    let imdb_id : String?
    let origin_country : [String]?
    let original_language : String?
    let original_title : String?
    let overview : String?
    let popularity : Double?
    let poster_path : String?
    let release_date : String?
    let revenue : Int?
    let runtime : Int?
    let status : String?
    let tagline : String?
    let title : String?
    let video : Bool?
    let vote_average : Double?
    let vote_count : Int?
    
    private enum CodingKeys: String, CodingKey {
        
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case belongs_to_collection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdb_id = "imdb_id"
        case origin_country = "origin_country"
        case original_language = "original_language"
        case original_title = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case release_date = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case vote_average = "vote_average"
        case vote_count = "vote_count"
    }
}

struct Genres : Codable {
    let id : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
    }
}


