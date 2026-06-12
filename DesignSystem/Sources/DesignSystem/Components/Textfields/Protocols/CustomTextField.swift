//
//  CustomTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//


import SwiftUI

/// Defines textfield UI style.
public enum TextfieldStyle {
    
    /// Bordered — box/border around the field
    case bordered
    /// Plain underline or borderless
    case underline
    /// None style applied to the textfield. Can be used if
    /// you want to design a custom one.
    case none
}

/// Protocol to create custom Textfields. Provides the most basic properties to
/// create whatever type of textfield.
public protocol CustomTextField {
    
    // MARK: - Public Properties
    
    /// Defines the UI of the textfield. Can be Bordered, inline or none if user wants to make your own style around the field.
    var style: TextfieldStyle { get set }

    /// Textfield field name to indicate what the textfield is intended for.
    var fieldName: String { get set }
    
    /// Textfield placeholder to hint what the textfield is intended for.
    var placeholder: String { get set }
    
    /// Textfield indicator to tell when its being focused by the user.
    var isFocused: Bool { get set }
    
    /// Textfield content written by the user.
    var textContent: String { get set }
}
