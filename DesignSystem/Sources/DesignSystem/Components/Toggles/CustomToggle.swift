//
//  CustomToggle.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 12/05/26.
//

import SwiftUI

public struct CustomToggleStyle: ToggleStyle {
    
    public init(){}
    
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

public struct CustomToggleStyle2: ToggleStyle {
    
    public init(){}
    
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
                    Text(configuration.isOn ? "ON" : "OFF")
                        .offset(x: configuration.isOn ? 22 : -22)
                }
                .animation(.spring(duration: 0.1), value: configuration.isOn)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    @Previewable @State var isOn = false
    Toggle("Styling 1", isOn: $isOn)
        .toggleStyle(CustomToggleStyle())
    Toggle("Styling 2", isOn: $isOn)
        .toggleStyle(CustomToggleStyle2())
}
