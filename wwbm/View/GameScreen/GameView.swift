//
//  GameView.swift
//  wwbm
//
//  Created by dsm 5e on 02.03.2024.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    @State private var showModalCorrectAnswer = false
    @State private var showModalWrongAnswer = false
    @State private var isLoading = false
    @State private var isAudienceHelpUsed: Bool = false
    @State private var isHalfOfQuestion: Bool = false
    @State private var isFriendHelp: Bool = false
    @State private var isNewGame: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Frame3")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    if let questions = viewModel.questions.first {
                        QuestionView(
                            isLoading: $isLoading,
                            question: questions
                        )
                        QuestionNuberView(index: viewModel.questionIndex, price: viewModel.questionsList[viewModel.questionIndex].value)
                        Spacer()
                        AnswerButtonsView(
                            viewModel: viewModel,
                            question: questions,
                            showModalCorrectAnswer: $showModalCorrectAnswer,
                            showModalWrongAnswer: $showModalWrongAnswer,
                            isHalfOfQuestion: $isHalfOfQuestion
                        )
                    } else {
                        Spacer()
                        Button(action: {
                            Task {
                                await viewModel.getQuestion()
                            }
                        }, label: {
                            Image(systemName: "repeat.circle")
                        })
                        Spacer()
                    }
                    Spacer()
                    DiggingForHelpView(isAudienceHelpUsed: $isAudienceHelpUsed, isHalfOfQuestion: $isHalfOfQuestion, isFrienHelp: $isFriendHelp, isNewGame: $isNewGame)
                }
                .padding()
                if isAudienceHelpUsed {
                    HelpRoomView(index: viewModel.corectAnswerIndex)
                        .onTapGesture {
                            isAudienceHelpUsed = false
                        }
                }
                if isFriendHelp {
                    ZStack {
                        Color.black.opacity(0.5)
                            .ignoresSafeArea()
                        VStack {
                            
                            if let questions = viewModel.questions.first {
                                
                                Text("Привет! Скорее всего \(questions.correctAnswer),но это не точно")
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.black)
                                    .padding()
                                    .background(.regularMaterial)
                                    .cornerRadius(15)
                            }
                        }
                        .padding()
                    }
                    .onTapGesture {
                        isFriendHelp = false
                    }
                }
            }
            .animation(.easeInOut, value: isAudienceHelpUsed)
            .onAppear {
                Task {
                    await viewModel.getQuestion()
                }
                AudioManager.shared.playSound(sound: .startTime)
            }
            .fullScreenCover(isPresented: $showModalCorrectAnswer, onDismiss: {
                AudioManager.shared.stopSound()
            }, content: {
                QuestionListView(viewModel: viewModel)
            })
            .onChange(of: showModalCorrectAnswer) { value in
                if !value {
                    Task {
                        await viewModel.getQuestion()
                    }
                    isHalfOfQuestion = false
                }
            }
            .fullScreenCover(isPresented: $showModalWrongAnswer, onDismiss: {
                AudioManager.shared.playSound(sound: .startTime)
                isNewGame.toggle()
                isHalfOfQuestion = false
            }, content: {
                WrongAnswerView(
                    showModalWrongAnswer: $showModalWrongAnswer,
                    viewModel: viewModel
                )
            })
            .onChange(of: showModalWrongAnswer) { value in
                if !value {
                    Task {
                        await viewModel.getQuestion()
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    GameView()
}
