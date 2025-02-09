//
//  MainView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                MovieListView()
                    .tabItem {
                        Label("Movies", systemImage: "film")
                    }
                FavoriteMoviesView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("Best Movies", systemImage: "heart")
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        }else{
            WelcomeScreenView()
        }
    }
}

#Preview {
    MainView()
}
