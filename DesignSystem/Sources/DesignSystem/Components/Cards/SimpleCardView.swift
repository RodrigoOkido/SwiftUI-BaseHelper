//
//  SimpleCardView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 15/05/25.
//
import SwiftUI

/// Simple Card View. Receives an optional header image, a title, and a description as
/// content. Provides an card style visualization about any sort of information. Provides
/// also the possibility to add some action if user click on it.
///
/// Usage example:
/// ```swift
///     SimpleCardView(headerImage: nil,
///                    title: "Sample",
///                    description: "Test",
///                    action: { // your action })
/// ```
public struct SimpleCardView: View {
    
    // MARK: - Private Properties
    
    /// Header image of the card (Optional).
    private let headerImage: Image?
    
    /// Title of the card.
    private let title: String
    
    /// Description of the card.
    private let description: String
    
    /// Action of the card when clicking (Optional).
    private let action: (() -> Void)?
    
    // MARK: - Initializer
    public init(headerImage: Image? = nil,
                title: String,
                description: String,
                action: (() -> Void)?
    ) {
        self.headerImage = headerImage
        self.title = title
        self.description = description
        self.action = action
    }
    
    // MARK: - Content
    public var body: some View {
        VStack(alignment: .leading) {
            if let headerImage {
                headerImage
                    .resizable()
                    .scaledToFill()
                    .frame(height: 150)
                    .accessibilityLabel("Card header image")
                    .accessibilityAddTraits(.isImage)
                Divider()
                    .padding(.vertical, StackSpacing.nano)
            }
            VStack(alignment: .leading, spacing: StackSpacing.nano) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)
                    .accessibilityLabel(title)
                    .accessibilityValue(title)
                    .accessibilityAddTraits(.isStaticText)
                Text(description)
                    .foregroundStyle(.black)
                    .accessibilityLabel(description)
                    .accessibilityValue(description)
                    .accessibilityAddTraits(.isStaticText)
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(CornerRadius.sm)
        .shadow(color: .black.opacity(OpacityLevel.transparent), radius: 2, y: 2)
        .onTapGesture {
            if let action {
                action()
            }
        }
        .accessibilityLabel("Card")
    }
}

#Preview {
    SimpleCardView(headerImage: nil,
                   title: "Sample",
                   description: "Test",
                   action: {})
}
