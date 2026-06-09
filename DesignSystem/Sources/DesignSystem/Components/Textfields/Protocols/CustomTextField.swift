//
//  CustomTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//


import SwiftUI

public protocol CustomTextField {
    
    // MARK: - Public Properties

    /// Textfield field name to indicate what the textfield is intended for.
    var fieldName: String { get set }
    
    /// Textfield placeholder to hint what the textfield is intended for.
    var placeholder: String { get set }
    
    /// Textfield indicator to tell when its being focused by the user.
    var isFocused: Bool { get set }
    
    /// Textfield content written by the user.
    var textContent: String { get set }
}

#Preview {
    SimpleTextField(fieldName: "Simple Textfield",
                    placeholder: "Enter your input",
                    textContent: .constant(""))
    RegularTextField(fieldName: "Regular Textfield",
                     placeholder: "Enter your input",
                     leadingIcon: Image(systemName: "person.crop.circle"),
                     textContent: .constant(""))
    RegularTextField(fieldName: "Regular Textfield",
                     placeholder: "Enter your input",
                     trailingIcon: Image(systemName: "magnifyingglass"),
                     textContent: .constant(""))
    PasswordTextField(fieldName: "Password",
                      placeholder: "Your password",
                      textContent: .constant(""))
    TextAreaField(fieldName: "Text Area", placeholder: "Enter your text", textContent: .constant(""))
}
