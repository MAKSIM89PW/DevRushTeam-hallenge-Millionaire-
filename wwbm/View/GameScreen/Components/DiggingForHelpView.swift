//
//  DiggingForHelp.swift
//  API
//
//  Created by Максим Нурутдинов on 27.02.2024.
//

import SwiftUI

struct DiggingForHelpView: View {
    @Binding var isAudienceHelpUsed: Bool
    @Binding var isHalfOfQuestion: Bool
    @Binding var isFrienHelp: Bool
    @Binding var isNewGame: Bool
    @State private var is5050Used = false
    @State private var isPhoneFriendUsed = false
    @State private var question: Question?
    @State private var buttonStates: [Bool] = Array(repeating: false, count: 4)
    let buttonTitles = ["50:50", "Помощь зала", "Помощь друга"]
    
    var body: some View {
        ZStack {
            
            HStack {
                
                ForEach(0..<buttonTitles.count, id: \.self) { index in
                    Button(action: {
                        self.buttonStates[index].toggle()
                        switch index {
                        case 0:
                            isHalfOfQuestion = true
                            is5050Used = true
                        case 1:
                            isAudienceHelpUsed = true
                        case 2:
                            isFrienHelp = true
                        default:
                            return
                        }
                    }) {
                        Text(self.buttonTitles[index])
                            .frame(width: 107, height: 83)
                            .font(.headline)
                            .foregroundColor(self.buttonStates[index] ? .black : .white)
                            .background(Ellipse().fill(.black))
                            .overlay {
                                ZStack {
                                    Ellipse().stroke(Color.blue, lineWidth: 4)
                                    if self.buttonStates[index] {
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .foregroundStyle(.red)
                                    } else {
                                        Image(systemName: "xmark")
                                            .opacity(0)
                                    }
                                }
                            }
                    }
                    .disabled(self.buttonStates[index] ? true : false)
                }
                .onChange(of: isNewGame) { newValue in
                    self.buttonStates = Array(repeating: false, count: 4)
                    self.is5050Used = false
                    self.isAudienceHelpUsed = false
                    self.isHalfOfQuestion = false
                }
            }
        }
        .ignoresSafeArea()
    }
}


struct BottomRectangle_Previews: PreviewProvider {
    static var previews: some View {
        DiggingForHelpView(isAudienceHelpUsed: .constant(true), isHalfOfQuestion: .constant(true), isFrienHelp: .constant(true), isNewGame: .constant(true))
    }
}

