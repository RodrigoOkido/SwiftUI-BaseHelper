//
//  OptionsSelectorView.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/06/26.
//

import SwiftUI

/// Selector type enum.
public enum SelectorType {
    case radio
    case checkbox
}

/// OptionsSelectorView provides the capability to offer a selector view
/// to the user. It can be single option with `radio`, or multiple option
/// with `checkbox`. If `radio`selected, the `selected list` will always
/// return a single element.
///
/// Usage example:
/// ```swift
///     @State var selected: [String] = []
///
///     OptionsSelectorView(type: .checkbox,
///                         options: ["Apple", "Banana", "Pear"],
///                         selected: $selected)
/// ```
public struct OptionsSelectorView: View {
    
    // MARK: - Property Wrappers
    
    /// Control all the selected options by the user
    @Binding var selected: [String]
    
    // MARK: - Private Properties
    
    /// Type of the selector
    private let type: SelectorType
    
    /// Option selectable list
    private let options: [String]
    
    // MARK: - Initializer
    public init(type: SelectorType,
                options: [String],
                selected: Binding<[String]>) {
        self.type = type
        self.options = options
        self._selected = selected
    }
    
    // MARK: - Content
    public var body: some View {
        switch type {
        case .radio:
            radioButtonSelectorView
        case .checkbox:
            checkboxSelectorView
        }
    }
    
    private var radioButtonSelectorView: some View {
        VStack(alignment: .leading, spacing: StackSpacing.md) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                   setSelection(option)
                }) {
                    HStack(spacing: StackSpacing.micro) {
                        ZStack {
                            Circle()
                                .stroke(selected.contains(option) ? Color.green : Color.gray, lineWidth: 2)
                                .frame(width: 24, height: 24)
                            
                            if isOptionSelected(option) {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 12, height: 12)
                            }
                        }
                        Text(option)
                            .accessibilityLabel(option)
                            .accessibilityAddTraits(.isStaticText)
                    }
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Radio button \(option)")
                .accessibilityValue(isOptionSelected(option) ? "Radio selected" : "Radio unselected")
                .accessibilityAddTraits(.isButton)
            }
        }
    }
    
    private var checkboxSelectorView: some View {
        VStack(alignment: .leading, spacing: StackSpacing.md) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    setSelection(option)
                }) {
                    HStack(spacing: StackSpacing.micro) {
                        Image(systemName: selected.contains(option)
                              ? "checkmark.square.fill"
                              : "square")
                            .font(.system(size: 24))
                            .foregroundColor(isOptionSelected(option) ? .blue : .gray)
                        
                        Text(option)
                            .accessibilityLabel(option)
                            .accessibilityAddTraits(.isStaticText)
                    }
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Checkbox \(option)")
                .accessibilityValue(isOptionSelected(option) ? "Checkbox selected" : "Checkbox unselected")
                .accessibilityAddTraits(.isButton)
            }
        }
    }
    
    // MARK: - Private Methods
    
    /// Verifies if the option is already selected.
    private func isOptionSelected(_ option: String) -> Bool {
        selected.contains(option)
    }
    
    /// Update the selection. Its based on the selection type.
    /// If `radio`, only the option selected is marked.
    /// If `checkbox` we add each selected option to the selected list. If element is
    /// already in the list, clicking again will remove this element.
    private func setSelection(_ option: String) {
        switch type {
        case .radio:
            selected = [option]
        case .checkbox:
            if isOptionSelected(option) {
                removeSelectedOption(option)
            } else {
                selected.append(option)
            }
        }
    }
    
    /// Remove the option from the selected list. Used for `checkbox` selection type.
    private func removeSelectedOption(_ option: String) {
        guard let index = selected.firstIndex(of: option) else { return }
        selected.remove(at: index)
    }
}

#Preview {
    @Previewable @State var selected: [String] = []
    OptionsSelectorView(type: .checkbox, options: ["Apple", "Banana", "Pear"], selected: $selected)
}
