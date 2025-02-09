//
//  WelcomeScreenView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Image("deneme")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500, height: 200)
                    .padding(.bottom,50)
                
                NavigationLink(destination: LoginView()){
                    Text("Giriş Yap")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink(destination: RegisterView()){
                    Text("Kayıt ol")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }.padding(.horizontal)
            }
        }
    }
}

#Preview {
    WelcomeScreenView()
}
