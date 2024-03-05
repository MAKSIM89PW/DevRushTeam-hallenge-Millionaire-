//
//  QuestionListView.swift
//  wwbm
//
//  Created by dsm 5e on 01.03.2024.
//

import Foundation
import SwiftUI

struct QuestionAmount: Identifiable {
    let id = UUID().uuidString
    let text: String
    let value: Int
}

struct QuestionListView: View {
    @ObservedObject var viewModel: GameViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundWelcomeImage(.frame1)
            
            VStack {
                Image(.image1)
                    .resizable()
                    .frame(width: 80, height: 80)
                Spacer()
                
                ForEach(Array(viewModel.questionsList.enumerated().reversed()), id: \.element.id) {
                    index,
                    questionAmount in
                    HStack {
                        Text(questionAmount.text)
                            .font(.subheadline)
                        Spacer()
                        Text(questionAmount.value.description)
                            .font(.headline)
                    }
                    .padding(.horizontal, 10)
                    .foregroundStyle(.white)
                    .padding(.vertical, 7)
                    .background(
                        ZStack {
                            LinearGradient(
                                gradient: Gradient(
                                    colors: viewModel.questionIndex + 1 <=  index && index != viewModel.questionsList.count - 1 ?
                                                   [Color.gray.opacity(0.5)]
                                                   :
                                                    index == viewModel.questionsList.count - 1 ?
                                                   [Color.yellow, Color(red: 95/255, green: 100/255, blue: 98/255)]
                                                   :
                                                    [Color(red: 26/255, green: 80/255, blue: 98/255), Color(red: 95/255, green: 163/255, blue: 98/255)]
                                                  ),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            
                            if [3, 7, 12].contains(index) {
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.blue.opacity(0.4)]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
//                                .opacity(viewModel.questionIndex + 1 <= index ? 1 : 0)
                            }
                        }
                        .animation(.easeInOut(duration: 2), value: index)
                    )
                    .cornerRadius(15)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 1)
                            .opacity(viewModel.questionIndex == index ? 1 : 0)
                            .animation(.easeInOut(duration: 2), value: index)
                            .padding(.horizontal)
                    )
                }
                Spacer()
            }
        }
        .onAppear {
            AudioManager.shared.playSound(sound: .successAnswer)
            withAnimation {
                viewModel.nextAnswer()
            }
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 6) {
                dismiss()
            }
        }
    }
}

#Preview {
    QuestionListView(viewModel: GameViewModel())
}
