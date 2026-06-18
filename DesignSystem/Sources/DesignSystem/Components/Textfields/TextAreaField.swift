//
//  TextAreaField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 14/05/26.
//

import SwiftUI

/// TextAreaField provides an area to user insert an text like feedbacks, comments or
/// whatever info which needs more space.
///
/// Usage example:
/// ```swift
///     TextAreaField(fieldName: "Write your feedback",
///                   placeholder: "Enter your text",
///                   textContent: .constant(""))
/// ```
public struct TextAreaField: CustomTextField, View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @FocusState public var isFocused: Bool
    @Binding public var textContent: String

    // MARK: - Public Properties
    public var style: TextfieldStyle    
    public var fieldName: String
    public var placeholder: String
    
    // MARK: - Computed Properties
    
    /// Textfield border.
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Initializer
    public init(
         style: TextfieldStyle = .bordered,
         fieldName: String,
         placeholder: String,
         textContent: Binding<String>) {
        self.style = style
        self.fieldName = fieldName
        self.placeholder = placeholder
        self._textContent = textContent
    }
    
    // MARK: - Content
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            TextField(placeholder,
                      text: $textContent,
                      axis: .vertical)
            .focused($isFocused)
            .lineLimit(5, reservesSpace: true)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.sm)
                    .stroke(borderColor, lineWidth: 0.5)
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
}

#Preview {
    TextAreaField(fieldName: "Write your feedback",
                  placeholder: "Enter your text",
                  textContent: .constant(""))
}
