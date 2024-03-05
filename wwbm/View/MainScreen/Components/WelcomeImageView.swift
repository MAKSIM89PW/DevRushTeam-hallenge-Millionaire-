//
//  WelcomeImageView.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct WelcomeImageView: View {
    
    let title: String
    let isWelcome: Bool
    let font: Font
    
    init(title: String, isWelcome: Bool = false, font: Font) {
        self.title = title
        self.isWelcome = isWelcome
        self.font = font
    }
    
    var body: some View {
        Image(.image1)
        
        if isWelcome {
            Text("Welcome")
                .foregroundStyle(.white)
                .font(.title)
        }

        Text(title)
            .font(font)
            .bold()
            .foregroundStyle(.white)
    }
}

#Preview {
    WelcomeImageView(title: "Кто хочет стать миллионером", font: .largeTitle)
}
