//
//  View + Ext.swift
//  wwbm
//
//  Created by dsm 5e on 26.02.2024.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
