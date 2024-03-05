//
//  GameViewModel.swift
//  wwbm
//
//  Created by dsm 5e on 02.03.2024.
//

import Foundation
import SwiftUI

final class GameViewModel: ObservableObject {
    @Published var questionIndex: Int = 0
    @Published var corectAnswerIndex: Int = 0
    @Published var shuffledAnswers: [String] = []
    @Published var questions: [Question] = []
    @Published var questionsList: [QuestionAmount] = [
        QuestionAmount(text: "Вопрос 1", value: 100),
        QuestionAmount(text: "Вопрос 2", value: 200),
        QuestionAmount(text: "Вопрос 3", value: 500),
        QuestionAmount(text: "Вопрос 4", value: 1000),
        QuestionAmount(text: "Вопрос 5", value: 2000),
        QuestionAmount(text: "Вопрос 6", value: 4000),
        QuestionAmount(text: "Вопрос 7", value: 6000),
        QuestionAmount(text: "Вопрос 8", value: 8000),
        QuestionAmount(text: "Вопрос 9", value: 16000),
        QuestionAmount(text: "Вопрос 10", value: 32000),
        QuestionAmount(text: "Вопрос 11", value: 64000),
        QuestionAmount(text: "Вопрос 12", value: 125000),
        QuestionAmount(text: "Вопрос 13", value: 250000),
        QuestionAmount(text: "Вопрос 14", value: 500000),
        QuestionAmount(text: "Вопрос 15", value: 1000000)
    ]
    
    func wrongAnswer() {
        //
    }

    func nextAnswer() {
        questionIndex += 1
        print("index : \(questionIndex)")
    }

    func newGame() {
        questionIndex = 0
    }

    @MainActor
    func getQuestion() async {
        guard let downloadedQuestions: QuizResponse = await ApiService.shared.downloadData(fromURL: "https://opentdb.com/api.php?amount=15&type=multiple") else { return }
        questions = downloadedQuestions.results
        if let firstQuestion = downloadedQuestions.results.first {
            var shuffledAnswers: [String] = firstQuestion.incorrectAnswers
            shuffledAnswers.append(firstQuestion.correctAnswer)
            shuffledAnswers.shuffle()
            self.shuffledAnswers = shuffledAnswers
            self.corectAnswerIndex = shuffledAnswers.firstIndex(of: firstQuestion.correctAnswer)!
            print("Correct answer index: \(corectAnswerIndex)")
        }
    }
}
