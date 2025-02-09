//
//  MovieDetailView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 2.02.2025.
//

import SwiftUI

struct MovieDetailView: View {
    
    let id : Int
    @ObservedObject var viewModel = MovieDetailViewViewModel()
    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                if let posterPath = viewModel.movieDetail?.poster_path {
                    let fullPosterURL = "https://image.tmdb.org/t/p/original\(posterPath)"
                    AsyncImage(url: URL(string: fullPosterURL)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView() // Yükleme göstergeci
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 450)
                                .cornerRadius(10)
                                .padding(.bottom,25)
                        case .failure:
                            Image(systemName: "photo") // Yüklenemezse varsayılan simge
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 450)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                HStack{
                    if viewModel.movieDetail?.adult != false {
                        Image(systemName: "18.square")
                            .foregroundStyle(.red)
                    }
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                        if isFavorite == true {
                            print("Beğenildi basıldı true oldu")
                            viewModel.addFavoriteMovie()
                        }else{
                            print("Beğenildi basıldı false oldu")
                        }
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .black)
                            .font(.system(size: 24))
                            }
                }.padding(.horizontal)
                    .padding(.bottom)
                
                Text(viewModel.movieDetail?.overview ?? "overview yüklenemedi...")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
            }.navigationTitle(viewModel.movieDetail?.title ?? "film adı").navigationBarTitleDisplayMode(.automatic).onAppear(){
                self.viewModel.filmDetayiAl(id: self.id)
            }
        }
    }
}

#Preview {
    MovieDetailView(id: 597)
}
