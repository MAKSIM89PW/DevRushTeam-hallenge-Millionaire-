//
//  AnswerButtonsView.swift
//  API
//
//  Created by Максим Нурутдинов on 29.02.2024.
//

import SwiftUI

struct AnswerButtonsView: View {
    @ObservedObject var viewModel: GameViewModel
    var question: Question?
    @Binding var showModalCorrectAnswer: Bool
    @Binding var showModalWrongAnswer: Bool
    @Binding var isHalfOfQuestion: Bool

    var body: some View {
        VStack(spacing: 20) {
            if let question = question {
                let numberOfAnswers = !isHalfOfQuestion ? viewModel.shuffledAnswers.count : 2
                ForEach(0..<numberOfAnswers, id: \.self) { index in
                    CustomButtonForAnswer(title: viewModel.shuffledAnswers[index], action: {
                        if viewModel.shuffledAnswers[index] == question.correctAnswer {
                            showModalCorrectAnswer = true
                        } else {
                            showModalWrongAnswer = true
                        }
                    })
                }
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    AnswerButtonsView(
        viewModel: GameViewModel(),
        question: Question(difficulty: .easy, correctAnswer: "Finders Keepers", incorrectAnswers: ["Double Dare", "Nickelodeon Guts", "Nick Arcade"], type: .multiple, category: "Entertainment: Television", question: "What Nickelodeon game show featured a house on the set that the contestants would ransack to find hidden objects?"),
        showModalCorrectAnswer: .constant(false),
        showModalWrongAnswer: .constant(false),
        isHalfOfQuestion: .constant(false)
    )
}
