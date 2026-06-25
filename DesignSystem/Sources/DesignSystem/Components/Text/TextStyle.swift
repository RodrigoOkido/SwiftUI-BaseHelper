//
//  TextStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 21/06/26.
//
import SwiftUI

// Components modifers
public extension View {
    
    /// This modifier intends to provide some text style configurations already pre defined. Its a good approach
    /// for real design system projects where usually do not have many different variations.
    /// Apps usually have a defined number of text designs which provides their identity and consistency across the app.
    func textStyle(_ style: TextStyle) -> some View {
        modifier(TextStyleModifier(style))
    }
}

struct TextStyleModifier: ViewModifier {
    
    // MARK: - Public Properties
    var style: TextStyle
    
    // MARK: - Initializer
    init(_ style: TextStyle) {
        self.style = style
    }
    
    // MARK: - Content
    func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(style.textColor)
            .fontWeight(style.fontWeight)
    }
}
