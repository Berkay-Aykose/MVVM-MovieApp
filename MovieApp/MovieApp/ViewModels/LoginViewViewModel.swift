//
//  LoginViewViewModel.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init () {
        
    }
    
    func login(){
        
        guard validate() else {
            return
        }
                
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if error != nil {
                self?.errorMessage = "Şifre veya email yanlış."
            }
        }
        
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen email adresi veya parola giriniz."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir email adresi giriniz."
            return false
        }
        
        return true
    }
}
