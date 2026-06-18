//
//  LiveDot.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 09/06/26.
//

import SwiftUI

/// A small pulsing dot used to represent "live" or "recording" states.
///
/// A solid colored dot sits on top of an outer ring that continuously scales
/// up and fades out, mimicking the familiar broadcast "live" indicator.
public struct LiveDot: View {

    // MARK: - Property Wrappers
    
    /// Controls the dot pulsing animation.
    @State private var isPulsing = false
    
    // MARK: - Private Properties
    
    /// Color of the live dot.
    private let color: Color
    
    /// Size of the live dot.
    private let size: CGFloat

    // MARK: - Initializer
    public init(color: Color = .green, size: CGFloat = 10) {
        self.color = color
        self.size = size
    }

    // MARK: - Content
    public var body: some View {
        ZStack {
            Circle()
                .fill(color.opacity(OpacityLevel.medium))
                .frame(width: size, height: size)
                .scaleEffect(isPulsing ? 2.4 : 1)
                .opacity(isPulsing ? 0 : 1)

            Circle()
                .fill(color)
                .frame(width: size, height: size)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.2).repeatForever(autoreverses: false)) {
                isPulsing = true
            }
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    HStack(spacing: StackSpacing.nano) {
        LiveDot()
        Text("Happening now")
            .font(.title2)
            .bold()
    }
    .padding()
}
