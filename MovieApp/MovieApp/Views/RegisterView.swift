//
//  RegisterView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var showErrorAlert = false

    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                    
                TextField("Name", text: $viewModel.name)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                TextField("Email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                BigButton(title: "Kayıt Ol", action: viewModel.register)
                    .padding()
                    .padding(.top,50)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("Hesabınız var mı? Giriş Yap")
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
    RegisterView()
}
