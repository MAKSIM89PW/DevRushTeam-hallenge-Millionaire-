//
//  MainScreen.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var mainScreenViewModel: MainScreenViewModel

    var body: some View {
        ZStack {
            BackgroundWelcomeImage(.frame1)

            VStack(spacing: 10) {
                Spacer()

                WelcomeImageView(
                    title: "Кто хочет стать миллионером?",
                    isWelcome: true,
                    font: .largeTitle
                )
                .multilineTextAlignment(.center)

                Spacer()

                // TODO: - Добавить переход на экран Правила игры
         
                NavLinkButton(
                    label: "Правила игры",
                    destination: RulesView()
                )


                NavLinkButton(
                    label: "Начало игры",
                    destination: StartGameView()
                        .environmentObject(mainScreenViewModel)
                )

                Spacer()
            }
        }
    }
}

#Preview {
    NavigationView {
        MainView()
            .environmentObject(MainScreenViewModel())
    }
}
