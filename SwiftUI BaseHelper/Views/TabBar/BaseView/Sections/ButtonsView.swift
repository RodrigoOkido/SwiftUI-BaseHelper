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
                VStack(alignment: .leading, spacing: StackSpacing.lg) {
                    
                    primaryStyleButtons
                    Divider()
                    secondaryStyleButtons
                    Divider()
                    tertiaryStyleButtons
                    Divider()
                    quaternaryStyleButtons
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Selectable buttons")
                    .textStyle(.subtitle)
                    .padding(.top, InsetSpacing.md)
                VStack(alignment: .leading, spacing: StackSpacing.xs) {
                    sectionHeader("Checkbox selector")
                    OptionsSelectorView(type: .checkbox,
                                        options: ["Option 1", "Option 2", "Option 3"],
                                        selected: $selectedOptions)
                    Divider()
                    sectionHeader("Radio type selector")
                        .padding(.top, InsetSpacing.xs)
                    OptionsSelectorView(type: .radio,
                                        options: ["Option 1", "Option 2", "Option 3"],
                                        selected: $selectedOption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(InsetSpacing.md)
        }
        .navigationTitle("Buttons")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var primaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            sectionHeader("Style 1")
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
            sectionHeader("Style 2")
            ScrollView(.horizontal) {
                HStack {
                    Button("Home") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "house"), shouldShowLabel: true))
                    Button("Food") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "fork.knife"), shouldShowLabel: true))
                    Button("Map") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "map"), shouldShowLabel: true))
                    Button("Settings") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "gear"), shouldShowLabel: true))
                }
            }
            
            sectionHeader("Style 2 alternative")
                .padding(.top, StackSpacing.micro)
            ScrollView(.horizontal) {
                HStack {
                    Button("Home") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "house"), shouldShowLabel: false))
                    Button("Food") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "fork.knife"), shouldShowLabel: false))
                    Button("Map") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "map"), shouldShowLabel: false))
                    Button("Settings") {
                        print("Custom button")
                    }
                    .buttonStyle(SecondaryButtonStyle(icon: Image(systemName: "gear"), shouldShowLabel: false))
                }
            }
        }
    }
    
    private var tertiaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            sectionHeader("Style 3")
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
    
    private var quaternaryStyleButtons: some View {
        VStack(alignment: .leading, spacing: StackSpacing.xs) {
            sectionHeader("Style 4")
            ScrollView(.horizontal) {
                HStack {
                    Button("Home") {
                        print("Custom button")
                    }
                    .buttonStyle(QuaternaryButtonStyle(icon: Image(systemName: "house")))
                    Button("Map") {
                        print("Custom button")
                    }
                    .buttonStyle(QuaternaryButtonStyle(icon: Image(systemName: "map")))
                    Button("Food") {
                        print("Custom button")
                    }
                    .buttonStyle(QuaternaryButtonStyle(icon: Image(systemName: "fork.knife")))
                    Button("Settings") {
                        print("Custom button")
                    }
                    .buttonStyle(QuaternaryButtonStyle(icon: Image(systemName: "gear")))
                }
            }
        }
    }
    
    @ViewBuilder
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
    }
}

#Preview {
    ButtonsView()
}
