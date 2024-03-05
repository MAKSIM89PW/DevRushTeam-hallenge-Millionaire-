//
//  QuestionView.swift
//  API
//
//  Created by Максим Нурутдинов on 26.02.2024.
//

import SwiftUI

import SwiftUI

struct QuestionView: View {
    @Binding var isLoading: Bool
    let question: Question?

    var body: some View {
        HStack(alignment: .center, content: {
            Image(.image1)
                .resizable()
                .frame(width: 87, height: 87)

            if isLoading {
                Text("Подождите, идет загрузка вопроса...")
                Spacer()
            } else {
                Text(decodeHTMLEntities(question?.question ?? "Ошибка запроса"))
                    .font(.subheadline).bold()
                    .foregroundStyle(.white)
                Spacer()
            }
        })
        .padding(.horizontal)
        .frame(height: UIScreen.main.bounds.width / 3.5)
    }

    func decodeHTMLEntities(_ text: String) -> String {
        var text = text
        text = text.replacingOccurrences(of: "&quot;", with: "\"")
        text = text.replacingOccurrences(of: "&#039;", with: "'")
        text = text.replacingOccurrences(of: "&amp;", with: "&")
        return text
    }
}
