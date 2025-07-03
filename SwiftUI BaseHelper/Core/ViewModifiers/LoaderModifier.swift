//
//  LoaderModifier.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import SwiftUI

// MARK: - Loader Mofifier
struct LoaderModifier: ViewModifier {
    
    @Binding private var isLoading: Bool
    
    init(_ isLoading: Binding<Bool>) {
        self._isLoading = isLoading
    }
    
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
