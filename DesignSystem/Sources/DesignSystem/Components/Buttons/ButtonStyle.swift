//
//  ButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 17/06/26.
//
import SwiftUI

// Components modifers
public extension View {
    
    /// This modifier intends to provide some button style configurations already pre defined. Its a good approach
    /// for real design system projects buttons where usually do not have many different variations.
    /// Apps usually have a defined number of button designs which provides their identity and consistency across the app.
    func buttonStyle(_ style: ButtonType) -> some View {
        modifier(ButtonStyleModifier(style))
    }
}

// MARK: - Button Component Modifier
struct ButtonStyleModifier: ViewModifier {
    
    // MARK: - Stored Properties
    var style: ButtonType
    
    init(_ style: ButtonType) {
        self.style = style
    }

    func body(content: Content) -> some View {
        content
            .padding()
            .background(style.backgroundColor)
            .font(style.font)
            .foregroundColor(style.textColor)
            .bold()
            .cornerRadius(CornerRadius.sm)
    }
}
