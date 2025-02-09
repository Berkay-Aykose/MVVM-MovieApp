//
//  MovieListeViewViewModel.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import Foundation
import SwiftUI

class MovieListeViewViewModel : ObservableObject{
    
    @Published var filmler = [MovieViewModel]()
     
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsim: String) {
        downloaderClient.filimleriIndir(search: filmIsim) { (sonuc) in
            switch sonuc {
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(MovieViewModel.init)
                    }
                }
            case .failure(let hata):
                print(hata)
            }
        }
    }
}

struct MovieViewModel {
    let film : Film
    
    var id : Int{
        film.id ?? 0
    }
    
    var poster_path : String{
        film.poster_path ?? "0"
    }
    
    var release_date : String{
        film.release_date ?? "0"
    }
    
    var title : String{
        film.title ?? "0"
    }
    
    var vote_average : Double{
        film.vote_average ?? 0
    }
}
 
