//
//  ImageView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 31.01.2025.
//

import SwiftUI

struct ImageView: View {
    
    let poster_path : String
    
    var body: some View {
        
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(poster_path)")) { phase in
            switch phase {
            case .empty:
                ProgressView() // Yüklenirken gösterilecek animasyon
            case .success(let image):
                image.resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                    .cornerRadius(8)
            case .failure:
                Image(systemName: "photo") // Hata olursa varsayılan ikon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 150)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview {
    ImageView(poster_path: "/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg")
}
