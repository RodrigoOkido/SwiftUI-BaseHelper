//
//  BasicViewModifiers.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 10/10/22.
//

import SwiftUI

// MARK: - Text Component Mofifier
struct ModifiedText: ViewModifier {
    
    var font: Font
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .bold()
    }
}

// MARK: - Button Component Modifier
struct ModifiedButton: ViewModifier {
    
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

// MARK: - TextField Component Modifier
struct ModifiedTextField: ViewModifier {
    
    var borderColor: Color

    func body(content: Content) -> some View {
        content
            .padding(15)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(borderColor, lineWidth: 2)
            )
    }
}
