//
//  MessageBubbleView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 24/07/26.
//
import SwiftUI

/// Horizontal alignment of a `MessageBubbleView` within its row —
/// `.leading` for received messages, `.trailing` for sent messages.
public enum MessageBubbleAlignment {
    case leading
    case trailing
}

/// A chat message bubble, aligned leading (received) or trailing (sent), with a
/// caller-supplied background color. Stack multiple bubbles in your own `VStack`
/// (e.g. `StackSpacing.nano` or `.xxs`) to build a chat thread.
///
/// Usage example:
/// ```swift
///     MessageBubbleView(text: "Hello!",
///                       backgroundColor: .blue,
///                       alignment: .trailing)
/// ```
public struct MessageBubbleView: View {

    // MARK: - Private Properties

    /// Message content.
    private let text: String

    /// Background color of the bubble.
    private let backgroundColor: Color

    /// Which side of the row the bubble sits on (received vs sent).
    private let alignment: MessageBubbleAlignment

    /// Text color override (Optional). Defaults to an adaptive black/white.
    private let textColor: Color?

    /// Maximum width of the bubble before text wraps (Optional). `nil` for unconstrained.
    private let maxWidth: CGFloat?

    // MARK: - Computed Properties
    private var resolvedTextColor: Color {
        textColor ?? .adaptive(light: .black, dark: .white)
    }

    // MARK: - Initializer
    public init(text: String,
                backgroundColor: Color,
                alignment: MessageBubbleAlignment = .trailing,
                textColor: Color? = nil,
                maxWidth: CGFloat? = WidthSize.xxl) {
        self.text = text
        self.backgroundColor = backgroundColor
        self.alignment = alignment
        self.textColor = textColor
        self.maxWidth = maxWidth
    }

    // MARK: - Content
    public var body: some View {
        HStack {
            if alignment == .trailing {
                Spacer(minLength: StackSpacing.xxl)
            }
            Text(text)
                .foregroundStyle(resolvedTextColor)
                .padding(.horizontal, InsetSpacing.md)
                .padding(.vertical, InsetSpacing.xs)
                .background(backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: CornerRadius.lg))
                .frame(maxWidth: maxWidth, alignment: alignment == .leading ? .leading : .trailing)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(alignment == .trailing ? "Sent message" : "Received message")
                .accessibilityValue(text)
                .accessibilityAddTraits(.isStaticText)
            if alignment == .leading {
                Spacer(minLength: StackSpacing.xxl)
            }
        }
    }
}

#Preview("MessageBubble") {
    VStack(spacing: StackSpacing.xxs) {
        MessageBubbleView(text: "Hey! Are we still on for lunch?",
                           backgroundColor: .gray.opacity(OpacityLevel.transparent),
                           alignment: .leading)
        MessageBubbleView(text: "Yes, 12:30 works great.",
                           backgroundColor: .blue,
                           alignment: .trailing)
        MessageBubbleView(text: "Perfect, see you there!",
                           backgroundColor: .gray.opacity(OpacityLevel.transparent),
                           alignment: .leading)
        MessageBubbleView(text: "This is a longer message to demonstrate how the bubble wraps text once it reaches the configured maximum width instead of stretching all the way across the screen.",
                           backgroundColor: .green,
                           alignment: .trailing)
        MessageBubbleView(text: "Custom text color example.",
                           backgroundColor: .yellow,
                           alignment: .trailing,
                           textColor: .black)
    }
    .padding()
}
