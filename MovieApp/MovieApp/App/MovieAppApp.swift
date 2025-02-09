//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import SwiftUI
import FirebaseCore

@main
struct MovieAppApp: App {
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
