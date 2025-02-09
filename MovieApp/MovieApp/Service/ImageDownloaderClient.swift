//
//  Image.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenResim: Data?
    
    func resimIndir(url: String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { Data, response, error in
            guard let data = Data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.indirilenResim = data

            }
            
        }.resume()
        
    }
}
