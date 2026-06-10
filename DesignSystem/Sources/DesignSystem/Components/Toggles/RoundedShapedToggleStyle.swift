//
//  RoundedShapedToggleStyle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 10/06/26.
//

import SwiftUI

/// Rounded shaped toggle style. This is a simple alternative toggle style similar to native
/// Apple toggle. It does not use Liquid Glass for its animation.
public struct RoundedShapedToggleStyle: ToggleStyle {
    
    // MARK: - Init
    public init(){}
    
    // MARK: - Content
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            RoundedRectangle(cornerRadius: 16)
                .fill(configuration.isOn ? Color.green : Color.gray.opacity(0.4))
                .frame(width: 50, height: 28)
                .overlay {
                    Circle()
                        .fill(.white)
                        .padding(3)
                        .offset(x: configuration.isOn ? 11 : -11)
                }
                .animation(.spring(duration: 0.2), value: configuration.isOn)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    @Previewable @State var isOn = false
    Toggle("Styling 1", isOn: $isOn)
        .toggleStyle(RoundedShapedToggleStyle())
}
