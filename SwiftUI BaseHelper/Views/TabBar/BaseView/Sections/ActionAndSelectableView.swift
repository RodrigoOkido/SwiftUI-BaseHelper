//
//  ButtonView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

enum FavoriteColor: String, CaseIterable, Identifiable {
    case blue
    case red
    case green
    case yellow
    case orange
    case purple
    
    var id: FavoriteColor { self }
}

struct ActionAndSelectableView: View {
    
    // MARK: - Property Wrappers
    @State var randomInt: Int
    @State var toggleStatus: Bool
    @State var selectedColor: FavoriteColor
    @State var birthDate: Date

    init(randomInt: Int = 0,
         toggleStatus: Bool = false,
         selectedColor: FavoriteColor = .blue, 
         birthDate: Date = Date()) {
        self.randomInt = randomInt
        self.toggleStatus = toggleStatus
        self.selectedColor = selectedColor
        self.birthDate = birthDate
    }

    var body: some View {
        ScrollView {
            VStack {
                // MARK: - Button
                HStack {
                    Button("Generate Number") {
                        randomInt = Int.random(in: 1..<1000)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(CornerRadius.sm)
                    Spacer()
                    Text(randomInt.description)
                }
                // MARK: - Toggle
                VStack {
                    Text("Toggles")
                    VStack {
                        Toggle(isOn: $toggleStatus) {
                            Text("Native Toggle")
                                .bold()
                                .font(.body)
                        }
                        Toggle("Styling 1", isOn: $toggleStatus)
                            .toggleStyle(CustomToggleStyle())
                            .bold()
                            .font(.body)
                        Toggle("Styling 2", isOn: $toggleStatus)
                            .toggleStyle(CustomToggleStyle2(withLabel: true))
                            .bold()
                            .font(.body)
                        Toggle("Styling 2 alternative", isOn: $toggleStatus)
                            .toggleStyle(CustomToggleStyle2(withLabel: false))
                            .bold()
                            .font(.body)
                        Text(toggleStatus ? "Toggle on" : "Toggle off")
                            .animation(.linear)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: .init(lineWidth: 1))
                    )
                }
                .padding(5)
                // MARK: - Picker
                VStack {
                    Text("Pickers")
                    VStack {
                        Text("Favorite Color:")
                            .bold()
                        Text("Palette")
                        Picker("Favorite Color", selection: $selectedColor) {
                            ForEach(FavoriteColor.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.palette)
                        Text("Menu")
                        Picker("Favorite Color", selection: $selectedColor) {
                            ForEach(FavoriteColor.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.menu)
                        Text("Wheel")
                        Picker("Favorite Color", selection: $selectedColor) {
                            ForEach(FavoriteColor.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.wheel)
                        Text("Segmented")
                        Picker("Favorite Color", selection: $selectedColor) {
                            ForEach(FavoriteColor.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: .init(lineWidth: 1))
                    )
                }
                .padding(5)
                // MARK: - DatePicker
                VStack {
                    Text("DatePickers")
                    VStack {
                        Text("Compact")
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                            Text("Select a date:")
                                .bold()
                        }.datePickerStyle(.compact)
                        
                        Text("Graphical")
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                            Text("Select a date:")
                                .bold()
                        }.datePickerStyle(.graphical)
                        
                        Text("Wheel")
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
        
                        }.datePickerStyle(.wheel)
                        
                        Text("Automatic")
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                            Text("Select a date:")
                                .bold()
                        }.datePickerStyle(.automatic)
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: .init(lineWidth: 1))
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .navigationTitle("Actions & Pickers")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    ActionAndSelectableView(randomInt: 0,
                            toggleStatus: true)
}
