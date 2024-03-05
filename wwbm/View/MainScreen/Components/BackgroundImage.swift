//
//  BackgroundWelcomeImage.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct BackgroundWelcomeImage: View {
    
    enum BackgroundImage: String {
        case frame1 = "Frame1"
        case frame2 = "Frame2"
        case frame3 = "Frame3"
    }
    
    let selectedImage: BackgroundImage
    
    init(_ selectedImage: BackgroundImage) {
        self.selectedImage = selectedImage
    }
    
    var body: some View {
        Image(selectedImage.rawValue)
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundWelcomeImage(.frame1)
}
