//
//  CustomButton.swift
//  API
//
//  Created by Максим Нурутдинов on 27.02.2024.
//

import SwiftUI

struct CustomButtonForHelp: View {
    let title: String
    let action: () -> Void
    @State private var isButtonPressed = UserDefaults.standard.bool(forKey: "isButtonPressed")
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .background(Ellipse().fill(self.isButtonPressed ? Color.white : Color.black)) // Изменяем цвет фона в зависимости от состояния
                .overlay {
                    Ellipse().stroke(Color.blue, lineWidth: 4)
                }
        }
    }
}

struct CustomButtonForAnswer: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                .font(.headline)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
}

#Preview(body: {
    VStack {
        CustomButtonForAnswer(title: "new butt") {
            
        }
    }
})
