//
//  ButtonModifier.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 10/10/22.
//
import SwiftUI

// MARK: - Button Component Modifier
struct ButtonModifier: ViewModifier {
    
    // MARK: - Stored Properties
    var color: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .font(.body)
            .foregroundColor(textColor)
            .bold()
            .cornerRadius(10)
    }
}
