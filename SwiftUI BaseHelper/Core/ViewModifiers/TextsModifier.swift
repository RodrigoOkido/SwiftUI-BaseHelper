//
//  TextModifier.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 08/06/26.
//
import SwiftUI

// MARK: - Text Component Mofifier
struct ModifiedText: ViewModifier {
    
    // MARK: - Stored Properties
    var font: Font
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(color)
            .bold()
    }
}
