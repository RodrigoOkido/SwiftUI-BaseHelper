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
                    .buttonStyle(.success)
                    Button("Error") {
                        UINotificationFeedbackGenerator().notificationOccurred(.error)
                    }
                    .buttonStyle(.danger)
                    Button("Warning") {
                        UINotificationFeedbackGenerator().notificationOccurred(.warning)
                    }
                    .buttonStyle(.warning)
                }
                Text("Impact Feedback types")
                    .bold()
                    .padding(.top, 30)
                HStack {
                    Button("Heavy") {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                    .buttonStyle(.primary)
                    Button("Light") {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    .buttonStyle(.primary)
                }
                HStack {
                    
                    Button("Medium") {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .buttonStyle(.primary)
                    Button("Rigid") {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }
                    .buttonStyle(.primary)
                    
                    Button("Soft") {
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    }
                    .buttonStyle(.primary)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.quarck)
                    .stroke(style: .init(lineWidth: 1))
            )
            Spacer()
        }
        .padding(InsetSpacing.xxs)
        .navigationTitle("Haptics")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    HapticsFeedbackView()
}
