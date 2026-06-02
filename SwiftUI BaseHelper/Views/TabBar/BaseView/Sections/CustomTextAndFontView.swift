//
//  CustomFontView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 25/04/25.
//
import SwiftUI
import DesignSystem

struct CustomTextAndFontView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack {
            
            // TEXT WITH MODIFIERS 
            VStack {
                Text("TEXT WITH MODIFIERS")
                VStack {
                    Text("Hello i am a normal text!")
                        .font(.system(size: 21))
                        .foregroundColor(.blue)
                        .bold()
                    Text("Hello i am a modified text!")
                        .modifiedTextStyle()
                    Text("Hello i am another modified text!")
                        .modifiedTextStyle(font: .body)
                    Text("Hello i am one more modified text!")
                        .modifiedTextStyle(font: .title2,
                                           color: isDarkMode ? .white : .black)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: .init(lineWidth: 1))
                )
            }
            .padding(5)

            // CUSTOM FONTS
            VStack {
                Text("CUSTOM FONTS")
                VStack {
                    Text("Text open sans bold")
                        .font(Font.openSans(.openSansBold, size: 24))
                    Text("Text open sans extra bold")
                        .font(Font.openSans(.openSansExtraBold, size: 24))
                    Text("Text open sans light")
                        .font(Font.openSans(.openSansLight, size: 24))
                    Text("Text open sans medium")
                        .font(Font.openSans(.openSansMedium, size: 24))
                    Text("Text open sans regular")
                        .font(Font.openSans(.openSansRegular, size: 24))
                    Text("Text open sans semi bold")
                        .font(Font.openSans(.openSansSemibold, size: 24))
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: .init(lineWidth: 1))
                )
            }
            .padding(5)
            Spacer()
        }

    }
}

#Preview {
    CustomTextAndFontView()
}
