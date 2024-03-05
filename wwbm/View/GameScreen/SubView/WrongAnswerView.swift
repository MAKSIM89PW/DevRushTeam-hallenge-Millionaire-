//
//  WrongAnswerView.swift
//  wwbm
//
//  Created by dsm 5e on 02.03.2024.
//

import SwiftUI

struct WrongAnswerView: View {
    
    @Binding var showModalWrongAnswer: Bool
    var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            Image("Frame3")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("К сожалению, ваш ответ неправильный.")
                    .font(.headline).bold()
                Button("Новая игра") {
                    viewModel.newGame()
                    showModalWrongAnswer = false // Закрываем модальный экран
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .onAppear {
            AudioManager.shared.playSound(sound: .failureAnswer)
        }
    }
}

#Preview {
    WrongAnswerView(showModalWrongAnswer: .constant(false), viewModel: GameViewModel())
}
