//
//  EmptyViewModel.swift
//  wwbm
//
//  Created by baikal on 26.02.2024.
//

import Foundation

class QuestionViewModel : ObservableObject {

    func getQuestion() async throws -> QuizResponse {
        let endpoint = "https://opentdb.com/api.php?amount=1&type=multiple"
        guard let url = URL(string: endpoint) else { throw QuestionErrorModel.urlError }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw QuestionErrorModel.responseError
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(QuizResponse.self, from: data)
        } catch {
            throw QuestionErrorModel.decodeError
        }
    }
        


}
