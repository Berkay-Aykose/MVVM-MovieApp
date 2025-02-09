//
//  MovieDetailViewViewModel.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 2.02.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class MovieDetailViewViewModel : ObservableObject{
    
    @Published var movieDetail : MovieDetailViewModel?
    @Published var favoriteMovies : [FavoriteMovies] = []
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(id : Int) {
        
        downloaderClient.filmDetailiIndir(id: id) { (result) in
            switch result {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.movieDetail = MovieDetailViewModel(detay: filmDetay)
                }
            }
        }
    }
    
    func addFavoriteMovie() {
        guard let movie = movieDetail else {
            return
        }
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let favorite = FavoriteMovies(id: String(movie.id), title: movie.title, poster_path: movie.poster_path, adult: movie.adult, overview: movie.overview)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("favoriteMovies")
            .document(favorite.id)
            .setData(favorite.asDictionary())
    }
}

struct MovieDetailViewModel{
    
    let detay : MovieDetail
    
    var adult : Bool {
        return detay.adult ?? false
    }
    
    var id : Int {
        return detay.id ?? 0
    }
    
    var imdb_id : String {
        return detay.imdb_id ?? ""
    }
    
    var overview : String {
        return detay.overview ?? ""
    }
    
    var poster_path : String {
        return detay.poster_path ?? ""
    }
    
    var release_date : String {
        return detay.release_date ?? ""
    }
    
    var title : String {
        return detay.title ?? ""
    }
    
    var vote_average : Double {
        return detay.vote_average ?? 0
    }
    
    var vote_count : Int {
        return detay.vote_count ?? 0
    }
    
    
    
}
