//
//  TagChipView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 09/06/26.
//
import SwiftUI

// MARK: - Style

/// Visual variant for a `TagChip`.
public enum TagChipStyle {

    /// Tinted label on a semi-transparent background. Best for lists.
    case pillFilled
    case squareFilled

    /// Tinted label with a colored border and no background fill.
    case pillOutlined
    case squareOutlined
}

/// A compact, pill or square shaped label for any categorical value.
///
/// Accepts plain strings and a `Color` so it can be driven by any domain
/// model — not just `ReminderTag`. Pass an SF Symbol name via `icon` to
/// prepend a small glyph.
///
/// Usage example:
/// ```swift
/// TagChipView(label: "Swift", color: .orange, icon: "swift")
/// TagChipView(label: "Archived", color: .gray)
/// ```
public struct TagChipView: View {

    // MARK: - Private Properties
    private let label: String
    private let color: Color
    private let icon: String?
    private let style: TagChipStyle

    // MARK: - Initializer
    public init(label: String,
                color: Color,
                icon: String? = nil,
                style: TagChipStyle = .pillFilled) {
        self.label = label
        self.color = color
        self.icon = icon
        self.style = style
    }

    // MARK: - Content
    public var body: some View {
        HStack(spacing: StackSpacing.quarck) {
            if let icon {
                Image(systemName: icon)
                    .font(.caption2)
                    .accessibilityHidden(true)
            }
            Text(label)
                .font(.caption2)
                .bold()
        }
        .foregroundStyle(color)
        .padding(.horizontal, InsetSpacing.nano)
        .padding(.vertical, StackSpacing.quarck)
        .background(background)
        .accessibilityLabel("Tag Chip")
        .accessibilityValue("\(label) tag with color \(color.description)")
    }

    @ViewBuilder
    private var background: some View {
        switch style {
        case .pillFilled:
            Capsule()
                .fill(color.opacity(OpacityLevel.transparent))
        case .pillOutlined:
            Capsule()
                .stroke(color, lineWidth: BorderWidth.thin)
        case .squareFilled:
            RoundedRectangle(cornerRadius: CornerRadius.quarck)
                .fill(color.opacity(OpacityLevel.transparent))
        case .squareOutlined:
            RoundedRectangle(cornerRadius: CornerRadius.quarck)
                .stroke(color, lineWidth: BorderWidth.thin)
        }
    }
}

// MARK: - Preview

#Preview("TagChip") {
    VStack(spacing: StackSpacing.xs) {
        // Pill
        HStack {
            TagChipView(label: "Swift", color: .orange, icon: "swift")
            TagChipView(label: "Design", color: .purple, icon: "pencil.and.ruler.fill")
            TagChipView(label: "Done", color: .green, icon: "checkmark")
            TagChipView(label: "Archived", color: .gray)
        }

        // Pill outlined
        HStack {
            TagChipView(label: "Swift", color: .orange, icon: "swift", style: .pillOutlined)
            TagChipView(label: "Design", color: .purple, icon: "pencil.and.ruler.fill", style: .pillOutlined)
            TagChipView(label: "Done", color: .green, icon: "checkmark", style: .pillOutlined)
            TagChipView(label: "Archived", color: .gray, style: .pillOutlined)
        }

        // Square filled
        HStack {
            TagChipView(label: "Swift", color: .orange, icon: "swift", style: .squareFilled)
            TagChipView(label: "Design", color: .purple, icon: "pencil.and.ruler.fill", style: .squareFilled)
            TagChipView(label: "Done", color: .green, icon: "checkmark", style: .squareFilled)
            TagChipView(label: "Archived", color: .gray, style: .squareFilled)
        }

        // Square outlined
        HStack {
            TagChipView(label: "Swift", color: .orange, icon: "swift", style: .squareOutlined)
            TagChipView(label: "Design", color: .purple, icon: "pencil.and.ruler.fill", style: .squareOutlined)
            TagChipView(label: "Done", color: .green, icon: "checkmark", style: .squareOutlined)
            TagChipView(label: "Archived", color: .gray, style: .squareOutlined)
        }
    }
    .padding()
}
