//
//  RegularTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 14/05/26.
//
import SwiftUI

public struct RegularTextField: CustomTextField, View {
    
    // MARK: - Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Binding public var textContent: String
    @FocusState public var isFocused: Bool

    // MARK: - Public Properties
    public var fieldName: String
    public var placeholder: String
    public var leadingIcon: Image?
    public var trailingIcon: Image?
    
    // MARK: - Computed Properties
    private var borderColor: Color {
        isFocused ? .orange : isDarkMode ? .white : .black
    }
    
    // MARK: - Init
    public init(
         fieldName: String,
         placeholder: String,
         leadingIcon: Image? = nil,
         trailingIcon: Image? = nil,
         textContent: Binding<String>) {
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
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.sm)
                    .stroke(borderColor, lineWidth: 1)
            )
            .animation(.easeInOut(duration: 0.2), value: isFocused)
        }
    }
}

#Preview {
    RegularTextField(fieldName: "Name",
                    placeholder: "Your name",
                    leadingIcon: Image(systemName: "person.crop.circle"),
                    textContent: .constant(""))
}
