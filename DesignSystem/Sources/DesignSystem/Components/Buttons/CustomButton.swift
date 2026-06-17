//
//  CustomButton.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

/// Custom Button to provide a fully custom button design.
///
/// Usage example:
/// ```swift
///     CustomButton(title: "Sample 1",
///                  action: {})
/// ```
public struct CustomButton: View {
    
    // MARK: - Stored Properties
    
    /// Preset of button type.
    private let type: ButtonType
    
    /// Title of the button.
    private let title: String
    
    /// Defines where the title will be aligned within the button.
    /// Can be centered, left-aligned, or right-aligned.
    private let alignment: ButtonContentPosition
    
    /// Leading image of the button title (Optional).
    private let leadingImage: Image?
    
    /// Trailing image of the button title (Optional).
    private let trailingImage: Image?
    
    /// Height of the button.
    private let height: ButtonHeight
    
    /// Padding of the button.
    private let padding: ButtonPadding
    
    /// Corner radius of the button.
    private let cornerRadius: ButtonCornerRadius
    
    /// Border of the button (Optional).
    private let borderColor: Color?
    
    /// Action of the button when clicked.
    private let action: () -> Void
    
    // MARK: - Init
    public init(type: ButtonType = .primary,
                title: String,
                alignment: ButtonContentPosition = .center,
                leadingImage: Image? = nil,
                trailingImage: Image? = nil,
                height: ButtonHeight = .normal,
                padding: ButtonPadding = .normal,
                cornerRadius: ButtonCornerRadius = .small,
                borderColor: Color? = nil,
                action: @escaping () -> Void) {
        self.type = type
        self.title = title
        self.alignment = alignment
        self.action = action
        self.leadingImage = leadingImage
        self.trailingImage = trailingImage
        self.height = height
        self.padding = padding
        self.cornerRadius = cornerRadius
        self.borderColor = borderColor
    }

    // MARK: - Content
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: StackSpacing.nano) {
                if alignment == .trailing {
                    Spacer()
                }
                if let leadingImage {
                    leadingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height.size * 0.5, height: height.size * 0.5)
                }
                Text(title)
                    .font(type.font)
                    .foregroundColor(type.textColor)
                    .bold()
                if let trailingImage {
                    trailingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height.size * 0.5, height: height.size * 0.5)
                }
                if alignment == .leading {
                    Spacer()
                }
            }
            .frame(height: height.size)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, padding.value)
            .background(type.backgroundColor)
            .cornerRadius(cornerRadius.value)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius.value)
                    .stroke(borderColor ?? .clear, lineWidth: 1)
            )
        }
    }

}

#Preview {
    CustomButton(title: "Sample 1",
                 action: {})
    CustomButton(title: "Sample 2",
                 leadingImage: Image(systemName: "globe"),
                 action: {})
    CustomButton(title: "Sample 3",
                 trailingImage: Image(systemName: "globe"),
                 action: {})
    CustomButton(type: .secondary,
                 title: "Sample secondary",
                 action: {})
    CustomButton(type: .tertiary,
                 title: "Sample tertiary",
                 action: {})
}
