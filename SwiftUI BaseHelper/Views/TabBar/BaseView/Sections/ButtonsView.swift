//
//  ButtonsView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/06/26.
//

import SwiftUI
import DesignSystem

struct ButtonsView: View {
    
    // MARK: - Property Wrappers
    @State private var selectedOptions: [String] = []
    @State private var selectedOption: [String] = []
    
    // MARK: - Content
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Buttons")
                    .font(.title2)
                    .bold()
                Button("Button 1 with viewModifier style") {
                    print("Custom button")
                }
                .buttonStyle(.primary)
                
                Button("Button 2 with viewModifier style") {
                    print("Custom button")
                }
                .buttonStyle(.secondary)
                
                Button("Button 3 with viewModifier style") {
                    print("Custom button")
                }
                .buttonStyle(.tertiary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.quarck)
                    .stroke(style: .init(lineWidth: 1))
            )
            
            VStack(alignment: .leading) {
                Text("Selectable buttons")
                    .font(.title2)
                    .bold()
                Text("Checkbox selector")
                OptionsSelectorView(type: .checkbox,
                                    options: ["Option 1", "Option 2", "Option 3"],
                                    selected: $selectedOptions)
                Text("Radio type selector")
                OptionsSelectorView(type: .radio,
                                    options: ["Option 1", "Option 2", "Option 3"],
                                    selected: $selectedOption)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.quarck)
                    .stroke(style: .init(lineWidth: 1))
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(InsetSpacing.quarck)
        .navigationTitle("Buttons")
    }
}
