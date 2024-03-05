//
//  MainScreenViewModel.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import Foundation
import Combine

final class MainScreenViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var isValidName: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $name
            .receive(on: RunLoop.main)
            .map { self.isValidInput($0) }
            .assign(to: \.isValidName, on: self)
            .store(in: &cancellables)
    }
    
    private func isValidInput(_ input: String) -> Bool {
        let nameRegex = "^[a-zA-Zа-яА-Я]+$"
        return NSPredicate(format: "SELF MATCHES %@", nameRegex).evaluate(with: input)
    }
}
