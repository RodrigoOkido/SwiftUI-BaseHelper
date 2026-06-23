//
//  SquareShapedToggleStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//

import SwiftUI

/// Square shaped toggle style. This style provides the option to add labeling (ON and
/// OFF) when toggle is activated by the user.
///
/// Usage example:
/// ```swift
///     Toggle("Styling 1", isOn: $isOn)
///         .toggleStyle(SquareShapedToggleStyle(withLabel: false))
/// ```
public struct SquareShapedToggleStyle: ToggleStyle {
    
    // MARK: - Private Properties
    
    /// Adds ON and OFF label to the toggle.
    private var withLabel: Bool
    
    // MARK: - Initializer
    public init(withLabel: Bool){
        self.withLabel = withLabel
    }
    
    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 4)
                .fill(configuration.isOn ? Color.green : Color.gray.opacity(0.4))
                .frame(width: 100, height: 28)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(.white)
                        .padding(3)
                        .frame(width: 55, height: 28)
                        .offset(x: configuration.isOn ? 22 : -22)
                    if withLabel {
                        Text(configuration.isOn ? "ON" : "OFF")
                            .offset(x: configuration.isOn ? 22 : -22)
                    }
                }
                .animation(.spring(duration: 0.1), value: configuration.isOn)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .accessibilityLabel("Toggle")
                .accessibilityValue(configuration.isOn ? "ON" : "OFF")
                .accessibilityAddTraits(.isToggle)
        }
    }
}

#Preview {
    @Previewable @State var isOn = false
    Toggle("Square Shaped Style", isOn: $isOn)
        .toggleStyle(SquareShapedToggleStyle(withLabel: false))
    Toggle("Square Shaped Style alternative", isOn: $isOn)
        .toggleStyle(SquareShapedToggleStyle(withLabel: true))
}
