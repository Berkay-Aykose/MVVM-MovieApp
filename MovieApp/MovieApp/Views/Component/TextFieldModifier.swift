//
//  TextFieldModifier.swift
//  MovieApp
//
//  Created by Berkay Veysel Ayköse on 28.01.2025.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(20)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,20)
            .autocapitalization(.none)
    }
}
