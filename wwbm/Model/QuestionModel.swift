// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct QuizResponse: Codable {
    let results: [Question]
    let responseCode: Int

    enum CodingKeys: String, CodingKey {
        case results
        case responseCode = "response_code"
    }
}

// MARK: - Result
struct Question: Codable, Equatable {
    let difficulty: Difficulty
    let correctAnswer: String
    var incorrectAnswers: [String]
    let type: TypeEnum
    let category, question: String

    enum CodingKeys: String, CodingKey {
        case difficulty
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case type, category, question
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case multiple = "multiple"
}

extension Question {
    static func == (lhs: Question, rhs: Question) -> Bool {
        return lhs.question == rhs.question &&
               lhs.correctAnswer == rhs.correctAnswer &&
               lhs.incorrectAnswers == rhs.incorrectAnswers
    }
}
