//
//  ExpandableCardView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 26/05/25.
//
import SwiftUI

/// Expandable Card View. Receives an optional leading icon, a title, and a View as
/// expandable content. It provides flexibility to make anything within the hidden content.
///
/// Usage example:
/// ```swift
///     ExpandableCardView(
///         icon: Image(systemName: "globe"),
///         title: "Expandable Card"
///     ) {
///         VStack {
///             Text("This is the hidden content that appears
///             when the card is expanded. You can put any
///             information here that you want to show when the
///             user taps on the card.")
///                 .foregroundStyle(.black)
///                 .padding()
///         }
///     }
/// ```
public struct ExpandableCardView<Content: View>: View {
    
    // MARK: - Property Wrappers
    @State private var isExpanded = false
    
    // MARK: - Private Propeties
    
    /// Icon of the Card (Optional).
    private let icon: Image?
    
    /// Title of the card.
    private let title: String
    
    /// Content of the expandable card. It expects a View to provide flexibility to the expandable content.
    private let innerContent: () -> Content
    
    // MARK: - Initializer
    public init(icon: Image? = nil,
                title: String,
                @ViewBuilder innerContent: @escaping () -> Content) {
        self.icon = icon
        self.title = title
        self.innerContent = innerContent
    }
    
    // MARK: - Content
    public var body: some View {
        VStack {
            HStack {
                if let icon {
                    icon
                        .resizable()
                        .frame(width: IconSize.xxs, height: IconSize.xxs)
                        .accessibilityLabel("Card icon")
                        .accessibilityAddTraits(.isImage)
                }
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .accessibilityLabel(title)
                    .accessibilityValue(title)
                    .accessibilityAddTraits(.isStaticText)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundStyle(.black)
                    .accessibilityLabel("Expands or Collapse icon")
                    .accessibilityValue(isExpanded ? "Expanded icon" : "Collapsed icon")

            }
            .padding()
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            .accessibilityLabel("Expandable Card")
            .accessibilityAddTraits(.isButton)
            
            if isExpanded {
                innerContent()
                    .transition(.opacity)
            }
        }
        .background(Color.white)
        .cornerRadius(CornerRadius.sm)
        .shadow(radius: 5)
    }
}

#Preview {
    ExpandableCardView(
        title: "Expandable Card",
    ) {
        VStack {
            Text("This is the hidden content that appears when the card is expanded. You can put any information here that you want to show when the user taps on the card.")
                .foregroundStyle(.black)
                .padding()
        }
    }
    .padding()
    ExpandableCardView(
        icon: Image(systemName: "globe"),
        title: "Expandable Card"
    ) {
        VStack {
            Text("This is the hidden content that appears when the card is expanded. You can put any information here that you want to show when the user taps on the card.")
                .foregroundStyle(.black)
                .padding()
        }
    }
    .padding()
}
