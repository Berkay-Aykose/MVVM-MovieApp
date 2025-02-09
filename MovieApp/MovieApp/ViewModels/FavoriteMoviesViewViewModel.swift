//
//  FavoriteMoviesViewViewModel.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 2.02.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FavoriteMoviesViewViewModel:ObservableObject {
    
    private let userId : String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("favoriteMovies")
            .document(id)
            .delete()
            
    }
    
}
