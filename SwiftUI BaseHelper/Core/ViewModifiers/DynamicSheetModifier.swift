//
//  DynamicSheetModifier.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 18/06/26.
//
import SwiftUI

/// Represents a ViewModifier to help set custom sheet height
struct DynamicSheetModifier: ViewModifier {
    
    // MARK: - Property Wrappers
    @Binding var height: CGFloat

    // MARK: - Initializer
    init(height: Binding<CGFloat>) {
        _height = height
    }

    // MARK: - Content
    func body(content: Content) -> some View {
        content.background(
            GeometryReader { geo -> Color in
                DispatchQueue.main.async {
                    height = geo.size.height
                }
                return Color.clear
            }
        )
        .presentationDetents([.height(height)])
    }
}
