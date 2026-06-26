//
//  TextStyleModifier.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/06/26.
//
import SwiftUI

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
