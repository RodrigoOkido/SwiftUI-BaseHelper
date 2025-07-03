//
//  CustomButton.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

public struct CustomButton: View {
    
    // MARK: - Stored Properties
    private let type: ButtonType
    private let title: String
    private let leadingImage: Image?
    private let trailingImage: Image?
    private let height: ButtonHeight
    private let padding: ButtonPadding
    private let cornerRadius: ButtonCornerRadius
    private let action: () -> Void
    
    public init(type: ButtonType = .primary,
                title: String,
                leadingImage: Image? = nil,
                trailingImage: Image? = nil,
                height: ButtonHeight = .normal,
                padding: ButtonPadding = .normal,
                cornerRadius: ButtonCornerRadius = .normal,
                action: @escaping () -> Void) {
        self.type = type
        self.title = title
        self.action = action
        self.leadingImage = leadingImage
        self.trailingImage = trailingImage
        self.height = height
        self.padding = padding
        self.cornerRadius = cornerRadius
    }

    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: StackSpacing.nano) {
                if let leadingImage {
                    leadingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height.size * 0.5, height: height.size * 0.5)
                }
                Text(title)
                    .font(type.fontSize)
                    .foregroundColor(type.textColor)
                    .bold()
                if let trailingImage {
                    trailingImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: height.size * 0.5, height: height.size * 0.5)
                }
            }
            .frame(height: height.size)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, padding.value)
            .background(type.backgroundColor)
            .cornerRadius(cornerRadius.value)
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
