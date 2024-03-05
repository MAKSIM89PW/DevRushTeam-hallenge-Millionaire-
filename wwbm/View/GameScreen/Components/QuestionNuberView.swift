//
//  QuestionNuberView.swift
//  API
//
//  Created by Максим Нурутдинов on 26.02.2024.
//

import SwiftUI

struct QuestionNuberView: View {
    
    var index: Int
    var price: Int
    
    var body: some View {
        HStack {
            Text("Вопрос №\((index + 1).description)")
                .padding(30)
            
            Spacer()
            Text("\(price.description) RUB")
                .padding(30)
        }
        .foregroundColor(.white)
    }
}

#Preview {
    QuestionNuberView(index: 1, price: 200)
}
