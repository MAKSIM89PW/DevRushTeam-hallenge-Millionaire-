//
//  NavLinkButton.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct NavLinkButton<Destination: View>: View {
    let label: String
    let destination: Destination

    init(label: String, destination: Destination) {
        self.label = label
        self.destination = destination
    }

    var body: some View {

                    NavigationLink(destination: destination) {
                                
                        Text(label)
                            .foregroundStyle(.black)
                            .padding()
                            .frame(maxWidth: UIScreen.main.bounds.width / 1.3)
                            .background(Color.white)
                            .cornerRadius(15)
                    }
    }
}

#Preview {
    NavigationView {
        NavLinkButton(label: "new text", destination: EmptyView())
    }
}
