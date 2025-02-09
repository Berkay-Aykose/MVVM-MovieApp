//
//  MainViewViewModel.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 27.01.2025.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject{
    
    @Published var currentUserId : String = ""
    
    init (){
        Auth.auth().addStateDidChangeListener { [weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool {
        return Auth.auth().currentUser != nil
    }
}
