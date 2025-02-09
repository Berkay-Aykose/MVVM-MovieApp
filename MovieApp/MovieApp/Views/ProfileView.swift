//
//  ProfileView.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if let user = viewModel.user {
                    Text("isim: \(user.name)")
                    Text("email: \(user.email)")
                    Text("Kayıt Tarihi: \(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }else{
                    Text("Profil yüklenemedi...")
                }
                
                BigButton(title: "Çıkış Yap", action: viewModel.logout)
                    .foregroundStyle(.red)
                
            }.navigationTitle("Profil ve Ayarlar Sayfası")
        }.onAppear() {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
