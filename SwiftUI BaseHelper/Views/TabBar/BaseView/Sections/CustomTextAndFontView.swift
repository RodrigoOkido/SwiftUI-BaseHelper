//
//  CustomFontView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 25/04/25.
//
import SwiftUI
import DesignSystem

struct CustomTextAndFontView: View {
    
    // MARK: - Property Wrappers
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // MARK: - Content
    var body: some View {
        VStack {
            // TEXT WITH MODIFIERS 
            VStack(alignment: .leading) {
                Text("TEXT WITH MODIFIERS")
                VStack(alignment: .leading) {
                    Text("Hello i am a modified text!")
                        .modifiedTextStyle()
                    Text("Hello i am another modified text!")
                        .modifiedTextStyle(font: .body)
                    Text("Hello i am one more modified text!")
                        .modifiedTextStyle(font: .title2,
                                           color: isDarkMode ? .white : .black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.quarck)
                        .stroke(style: .init(lineWidth: 1))
                )
            }
            .padding(InsetSpacing.xxs)

            // CUSTOM FONTS
            VStack(alignment: .leading) {
                Text("CUSTOM FONTS")
                VStack(alignment: .leading) {
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.quarck)
                        .stroke(style: .init(lineWidth: 1))
                )
            }
            .padding(InsetSpacing.xxs)
            Spacer()
        }
        .navigationTitle("Fonts")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CustomTextAndFontView()
}
