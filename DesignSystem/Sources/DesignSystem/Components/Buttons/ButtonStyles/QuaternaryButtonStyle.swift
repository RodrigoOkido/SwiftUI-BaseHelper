//
//  QuaternaryButtonStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 29/06/26.
//

import SwiftUI

public struct QuaternaryButtonStyle: ButtonStyle {

    // MARK: - Private Properties
    private let icon: Image
    private let style: ButtonConfigurationStyle

    // MARK: - Initializer
    public init(icon: Image, _ style: ButtonConfigurationStyle = .regular) {
        self.icon = icon
        self.style = style
    }

    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: CornerRadius.sm)
                .fill(style.backgroundColor)
                .frame(width: 85, height: 85)
                .overlay {
                    VStack(alignment: .center, spacing: StackSpacing.quark) {
                        Spacer()
                        icon
                            .resizable()
                            .foregroundStyle(style.iconColor)
                            .frame(width: IconSize.md, height: IconSize.md)
                            .aspectRatio(contentMode: .fit)
                            .accessibilityLabel("Icon")
                            .accessibilityAddTraits(.isImage)
                        Spacer()
                    }
                }
        }
        .padding(StackSpacing.nano)
        .opacity(configuration.isPressed ? OpacityLevel.opaque : OpacityLevel.solid)
        .accessibilityAddTraits(.isButton)
    }
}
