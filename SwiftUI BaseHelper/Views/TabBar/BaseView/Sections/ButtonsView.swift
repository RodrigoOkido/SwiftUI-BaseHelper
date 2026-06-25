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
                VStack(alignment: .leading, spacing: StackSpacing.md) {
                    
                    primaryStyleButtons
                    secondaryStyleButtons
                    tertiaryStyleButtons
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.nano)
                        .stroke(style: .init(lineWidth: 1))
                )
                
                Text("Selectable buttons")
                    .textStyle(.subtitle)
                    .padding(.top, InsetSpacing.md)
                VStack(alignment: .leading, spacing: StackSpacing.xs) {
                    Text("Checkbox selector")
                    OptionsSelectorView(type: .checkbox,
                                        options: ["Option 1", "Option 2", "Option 3"],
                                        selected: $selectedOptions)
                    Text("Radio type selector")
                        .padding(.top, InsetSpacing.xs)
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
    
    private var primaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            Text("Style 1")
                .textStyle(.subtitle2)
            ScrollView {
                Button("Home") {
                    print("Custom button")
                }
                .buttonStyle(PrimaryButtonStyle(icon: Image(systemName: "house")))
                Button("Food") {
                    print("Custom button")
                }
                .buttonStyle(PrimaryButtonStyle(icon: Image(systemName: "fork.knife")))
                Button("Map") {
                    print("Custom button")
                }
                .buttonStyle(PrimaryButtonStyle(icon: Image(systemName: "map")))
                Button("Settings") {
                    print("Custom button")
                }
                .buttonStyle(PrimaryButtonStyle(icon: Image(systemName: "gear")))
            }
        }
    }
    
    private var secondaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            Text("Style 2")
                .textStyle(.subtitle2)
            ScrollView(.horizontal) {
                HStack {
                    Button("Home") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "house")))
                    Button("Food") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "fork.knife")))
                    Button("Map") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "map")))
                    Button("Settings") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "gear")))
                }
            }
        }
    }
    
    private var tertiaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            Text("Style 3")
                .textStyle(.subtitle2)
            ScrollView(.horizontal) {
                HStack {
                    Button("Home") {
                        print("Custom button")
                    }
                    .buttonStyle(TertiaryButtonStyle(icon: Image(systemName: "house")))
                    Button("Map") {
                        print("Custom button")
                    }
                    .buttonStyle(TertiaryButtonStyle(icon: Image(systemName: "map")))
                    Button("Food") {
                        print("Custom button")
                    }
                    .buttonStyle(TertiaryButtonStyle(icon: Image(systemName: "fork.knife")))
                    Button("Settings") {
                        print("Custom button")
                    }
                    .buttonStyle(TertiaryButtonStyle(icon: Image(systemName: "gear")))
                }
            }
        }
    }
}

#Preview {
    ButtonsView()
}
