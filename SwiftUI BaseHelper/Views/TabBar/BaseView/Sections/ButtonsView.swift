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
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Buttons")
                        .font(.title2)
                        .bold()
                    Button("Button 1") {
                        print("Custom button")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Button("Button 2") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "globe")))
                    
                    Button("Button 3") {
                        print("Custom button")
                    }
                    .buttonStyle(TertiaryButtonStyle(icon: Image(systemName: "globe")))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.nano)
                        .stroke(style: .init(lineWidth: 1))
                )
                
                VStack(alignment: .leading, spacing: StackSpacing.xs) {
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.nano)
                        .stroke(style: .init(lineWidth: 1))
                )
                Spacer()
            }
            .padding(InsetSpacing.md)
        }
        .navigationTitle("Buttons")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ButtonsView()
}
