//
//  PickersAndTogglesView.swift
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

struct PickersAndTogglesView: View {
    
    // MARK: - Property Wrappers
    @State var toggleStatus: Bool
    @State var selectedColor: FavoriteColor
    @State var birthDate: Date
    
    // MARK: - Initializer
    init(toggleStatus: Bool = false,
         selectedColor: FavoriteColor = .blue,
         birthDate: Date = Date()) {
        self.toggleStatus = toggleStatus
        self.selectedColor = selectedColor
        self.birthDate = birthDate
    }
    
    // MARK: - Content
    var body: some View {
        ScrollView {
            VStack {
                // MARK: - Picker
                pickersSectionView
                // MARK: - DatePicker
                datepickerSectionView
                // MARK: - Toggle
                toggleSectionView
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Actions & Pickers")
        .navigationBarTitleDisplayMode(.large)
    }
    
    private var pickersSectionView: some View {
        VStack(alignment: .leading) {
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
                RoundedRectangle(cornerRadius: CornerRadius.quark)
                    .stroke(style: .init(lineWidth: 1))
            )
        }
        .padding(InsetSpacing.md)
    }
    
    private var datepickerSectionView: some View {
        VStack(alignment: .leading) {
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
                RoundedRectangle(cornerRadius: CornerRadius.quark)
                    .stroke(style: .init(lineWidth: 1))
            )
        }
        .padding(InsetSpacing.md)
    }
    
    
    private var toggleSectionView: some View {
        VStack(alignment: .leading) {
            Text("Toggles")
            VStack {
                Toggle(isOn: $toggleStatus) {
                    Text("Native Toggle")
                        .bold()
                        .font(.body)
                }
                Toggle("Styling 1", isOn: $toggleStatus)
                    .toggleStyle(RoundedShapedToggleStyle())
                    .bold()
                    .font(.body)
                Toggle("Styling 2", isOn: $toggleStatus)
                    .toggleStyle(SquareShapedToggleStyle(withLabel: true))
                    .bold()
                    .font(.body)
                Toggle("Styling 2 alternative", isOn: $toggleStatus)
                    .toggleStyle(SquareShapedToggleStyle(withLabel: false))
                    .bold()
                    .font(.body)
                Text(toggleStatus ? "Toggle on" : "Toggle off")
                    .animation(.linear)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.quark)
                    .stroke(style: .init(lineWidth: 1))
            )
        }
        .padding(InsetSpacing.md)
    }
}
    
#Preview {
    PickersAndTogglesView(toggleStatus: true)
}
