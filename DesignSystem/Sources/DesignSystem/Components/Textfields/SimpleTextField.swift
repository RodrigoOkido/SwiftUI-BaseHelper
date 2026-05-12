//
//  SimpleTextField.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//

import SwiftUI

public struct SimpleTextField: View {
    
    private let fieldName: String
    private let placeholder: String
    @Binding private var text: String
    
    public init(fieldName: String,
         placeholder: String,
         text: Binding<String>) {
        self.fieldName = fieldName
        self.placeholder = placeholder
        self._text = text
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text("\(fieldName)")
                .bold()
            TextField("\(placeholder)",
                      text: $text)
            .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    SimpleTextField(fieldName: "Name",
                    placeholder: "Insert your name",
                    text: .constant(""))
}
