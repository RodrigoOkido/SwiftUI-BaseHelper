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
            VStack(alignment: .leading) {
                sectionHeader("Notification Feedback types")
                HStack {
                    Button("Success") {
                        UINotificationFeedbackGenerator().notificationOccurred(.success)
                    }
                    .buttonStyle(PrimaryButtonStyle(.success))
                    .frame(width: 120, height: 60)
                    Button("Error") {
                        UINotificationFeedbackGenerator().notificationOccurred(.error)
                    }
                    .buttonStyle(PrimaryButtonStyle(.danger))
                    .frame(width: 120, height: 60)

                    Button("Warning") {
                        UINotificationFeedbackGenerator().notificationOccurred(.warning)
                    }
                    .buttonStyle(PrimaryButtonStyle(.warning))
                    .frame(width: 120, height: 60)

                }
                sectionHeader("Impact Feedback types")
                    .padding(.top, 30)
                HStack {
                    Spacer()
                    Button("Heavy") {
                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    .frame(width: 120, height: 60)

                    Button("Light") {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    .frame(width: 120, height: 60)
                    Spacer()
                }
                HStack {
                    Button("Medium") {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    .frame(width: 120, height: 60)
                    Button("Rigid") {
                        UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    .frame(width: 120, height: 60)
                    Button("Soft") {
                        UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                    }
                    .buttonStyle(PrimaryButtonStyle(.regular))
                    .frame(width: 120, height: 60)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .padding(InsetSpacing.md)
        .navigationTitle("Haptics")
        .navigationBarTitleDisplayMode(.large)
    }
    
    @ViewBuilder
    private func sectionHeader(_ title: String) -> some View {
        Text(title)
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundStyle(.secondary)
            .textCase(.uppercase)
    }
}

#Preview {
    HapticsFeedbackView()
}
