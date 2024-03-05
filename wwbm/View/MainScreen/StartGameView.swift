//
//  StartGameView.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct StartGameView: View {
    @EnvironmentObject var vm: MainScreenViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundWelcomeImage(.frame2)
            
            VStack(spacing: 30) {
                
                WelcomeImageView(title: "Введите свой никнейм", font: .title)
                
                TextField("", text: $vm.name)
                    .foregroundColor(.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.3)
                
                NavigationLink {
                    GameView()
                } label: {
                    Text("Регистрация")
                        .foregroundStyle(vm.isValidName ? Color.black : Color.white.opacity(0.5))
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.3)
                        .background(vm.isValidName ? Color.white : Color.gray.opacity(0.2))
                        .cornerRadius(15)
                }
                .disabled(!vm.isValidName)
                
                Spacer()
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        vm.name = ""
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                    })
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

#Preview {
    NavigationView {
        StartGameView()
            .environmentObject(MainScreenViewModel())
    }
}

