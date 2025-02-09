//
//  LoginView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    @State private var showErrorAlert = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                TextField("Email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                BigButton(title: "Giriş Yap", action: viewModel.login)
                    .padding()
                    .padding(.top,50)
                
                Spacer()
                
                NavigationLink(destination: RegisterView()){
                    Text("Bir hesabınız yok mu? Kayıt Ol")
                }
            }.onChange(of: viewModel.errorMessage) {
                showErrorAlert = !viewModel.errorMessage.isEmpty
            }
            .alert("Hata", isPresented: $showErrorAlert, actions: {
                Button("Tamam", role: .cancel) {
                    viewModel.errorMessage = "" // Hata mesajını sıfırla
                }
            }, message: {
                Text(viewModel.errorMessage)
            })
        }
    }
}

#Preview {
    LoginView()
}
