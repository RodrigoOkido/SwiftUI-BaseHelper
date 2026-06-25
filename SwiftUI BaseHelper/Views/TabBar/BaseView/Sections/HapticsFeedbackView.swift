//
//  HapticsFeedbackView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 26/10/22.
//

import SwiftUI
import DesignSystem

struct HapticsFeedbackView: View {
    
    var body: some View {
        VStack {
            Text("You must test this on a real device to feel the different feedback types")
                .padding(.bottom, StackSpacing.xxs)
            VStack {
                Text("Notification Feedback types")
                    .bold()
                HStack {
                    Button("Success") {
                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                    }
                    .buttonStyle(PrimaryButtonStyle(.success))
                    Button("Error") {
                        UINotificationFeedbackGenerator().notificationOccurred(.error)
                    }
                    .buttonStyle(PrimaryButtonStyle(.danger))
                    Button("Warning") {
                        UINotificationFeedbackGenerator().notificationOccurred(.warning)
                    }
                    .buttonStyle(PrimaryButtonStyle(.warning))
                }
                Text("Impact Feedback types")
                    .bold()
                    .padding(.top, 30)
                HStack {
                    Button("Heavy") {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    Button("Light") {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                }
                HStack {
                    
                    Button("Medium") {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    Button("Rigid") {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))

                    Button("Soft") {
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.nano)
                    .stroke(style: .init(lineWidth: 1))
            )
            Spacer()
        }
        .padding(InsetSpacing.md)
        .navigationTitle("Haptics")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    HapticsFeedbackView()
}
