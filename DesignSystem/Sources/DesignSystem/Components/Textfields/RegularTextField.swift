//
//  RegularTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 14/05/26.
//
import SwiftUI

/// Textfield that provides input with optional for styling inserting icons on
/// leading or trailing.
///
/// Usage example:
/// ```swift
///     RegularTextField(style: .bordered,
///                      fieldName: "Name",
///                      placeholder: "Your name",
///                      leadingIcon: Image(systemName: "person.crop.circle")
/// ```
public struct RegularTextField: CustomTextField, View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Binding public var textContent: String
    @FocusState public var isFocused: Bool

    // MARK: - Public Properties
    public var style: TextfieldStyle
    public var fieldName: String
    public var placeholder: String
    public var leadingIcon: Image?
    public var trailingIcon: Image?
    
    // MARK: - Computed Properties
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Initializer
    public init(
         style: TextfieldStyle,
         fieldName: String,
         placeholder: String,
         leadingIcon: Image? = nil,
         trailingIcon: Image? = nil,
         textContent: Binding<String>) {
        self.style = style
        self.fieldName = fieldName
        self.placeholder = placeholder
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self._textContent = textContent
    }
    
    // MARK: - Content
    public var body: some View {
        VStack(alignment: .leading) {
            Text(fieldName)
                .bold()
            HStack(spacing: StackSpacing.quarck) {
                if let leadingIcon {
                    leadingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                }
                TextField(placeholder,
                          text: $textContent,
                          axis: .vertical
                )
                .focused($isFocused)
                .padding(.horizontal, InsetSpacing.quarck)
                if let trailingIcon {
                    Spacer()
                    trailingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: IconSize.xs, height: IconSize.xs)
                }
            }
            .padding()
            .overlay(styleOverlay)
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
    
    @ViewBuilder
    private var styleOverlay: some View {
        switch style {
        case .bordered:
            RoundedRectangle(cornerRadius: CornerRadius.sm)
                .stroke(borderColor, lineWidth: 0.5)
        case .underline:
            VStack {
                Spacer()
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundStyle(borderColor)
            }
        case .none:
            EmptyView()
        }
    }
}

#Preview {
    RegularTextField(style: .bordered,
                     fieldName: "Name",
                     placeholder: "Your name",
                     leadingIcon: Image(systemName: "person.crop.circle"),
                     textContent: .constant(""))
    RegularTextField(style: .underline,
                     fieldName: "Name",
                     placeholder: "Your name",
                     leadingIcon: Image(systemName: "person.crop.circle"),
                     textContent: .constant(""))
    RegularTextField(style: .none,
                     fieldName: "Name",
                     placeholder: "Your name",
                     leadingIcon: Image(systemName: "person.crop.circle"),
                     textContent: .constant(""))
}
