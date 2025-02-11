//
//  DownloaderClient.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import Foundation


class DownloaderClient{
    
    func filimleriIndir(search: String, completion: @escaping (Result<[Film]?, DownloaderError>) -> Void) {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=(API_KEY)=\(search)") else { return completion(.failure(.yanlisURLHata)) }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmediHata))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslemindeHata))
            }
            
            completion(.success(filmCevabi.results))
            
        }.resume()
    }
    
    func filmDetailiIndir(id: Int, completion: @escaping (Result<MovieDetail, DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=784138a2ce66c877cb801217daaa1a5a") else {
            return completion(.failure(.yanlisURLHata)) }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.veriGelmediHata))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
                return completion(.failure(.veriIslemindeHata))
            }
            completion(.success(gelenFilmDetayi))
            
        }.resume()
    }
}

enum DownloaderError: Error {
    case yanlisURLHata
    case veriGelmediHata
    case veriIslemindeHata
}
