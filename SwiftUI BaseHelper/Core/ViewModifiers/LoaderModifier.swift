//
//  LoaderModifier.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import SwiftUI

// MARK: - Loader Mofifier
struct LoaderModifier: ViewModifier {
    
    // MARK: - Property Wrappers
    @Binding private var isLoading: Bool
    
    // MARK: - Initializer
    init(_ isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }
    
    // MARK: - Content
    func body(content: Content) -> some View {
        ZStack {
            content
            if isLoading {
                Rectangle()
                    .fill(Color.black.opacity(0.4))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .overlay {
                        VStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
            }
        }
    }
}
