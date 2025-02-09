//
//  ContentView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var viewModel: MovieListeViewViewModel
    @State var arananFilmIsmi = ""
    
    init() {
        self.viewModel = MovieListeViewViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Aranacak Film", text: $arananFilmIsmi, onCommit: {
                    self.viewModel.filmAramasiYap(
                        filmIsim: arananFilmIsmi.trimmingCharacters(in: .whitespacesAndNewlines)
                            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? arananFilmIsmi
                    )
                })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                if viewModel.filmler.isEmpty {
                    VStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.gray)
                        Text("Film aramak için yukarıya yazınız.")
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    List(viewModel.filmler, id: \.id) { film in
                        NavigationLink(destination: MovieDetailView(id: film.id)) {
                            HStack {
                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(film.poster_path)")) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)
                                            .cornerRadius(8)
                                    case .failure:
                                        Image(systemName: "photo")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)
                                            .foregroundColor(.gray)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                                VStack(alignment: .leading) {
                                    Text(film.title)
                                        .font(.title3)
                                        .foregroundStyle(.blue)
                                    
                                    Text(film.release_date)
                                        .foregroundStyle(.orange)
                                    
                                    HStack {
                                        Text(film.vote_average.description)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Film Listesi")
        }
    }
}

#Preview {
    MovieListView()
}
