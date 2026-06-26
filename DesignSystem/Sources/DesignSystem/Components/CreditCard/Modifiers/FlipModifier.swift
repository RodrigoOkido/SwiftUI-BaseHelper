//
//  FlipModifier.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/06/26.
//

import SwiftUI

struct FlipModifier: ViewModifier, Animatable {
    var angle: Double

    nonisolated var animatableData: Double {
        get { angle }
        set { angle = newValue }
    }

    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees(angle), axis: (x: 0, y: 1, z: 0), perspective: 0.35)
            .opacity(abs(angle) <= 90 ? 1 : 0)
    }
}
