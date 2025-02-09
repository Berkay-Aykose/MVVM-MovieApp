//
//  LikedMoviesView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 31.01.2025.
//

import SwiftUI
import FirebaseFirestore

struct FavoriteMoviesView: View {
    
    @StateObject var viewModel : FavoriteMoviesViewViewModel
    @FirestoreQuery var items: [FavoriteMovies]
    
    init(userId :String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/favoriteMovies")
        self._viewModel = StateObject(wrappedValue: FavoriteMoviesViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    NavigationLink(destination: MovieDetailView(id: Int(item.id) ?? 0)){
                        HStack{
                            ImageView(poster_path: item.poster_path)
                                .swipeActions{
                                    Button("Sil"){
                                        viewModel.delete(id: item.id)
                                    }
                                    .background(Color.red)
                                }
                            
                            VStack{
                                Text(item.title)
                                    .font(.title3)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                }
            }.listStyle(PlainListStyle()) // arka plan gider
                .navigationTitle("Favorite movies")
        }
    }
}


#Preview {
    FavoriteMoviesView(userId: "i5i7aS0sJWdPzH0ouskouv1dkcq2")
}

