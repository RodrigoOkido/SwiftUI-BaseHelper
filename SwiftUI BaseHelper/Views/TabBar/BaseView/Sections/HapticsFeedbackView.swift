//
//  HapticsFeedbackView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 26/10/22.
//

import SwiftUI

struct HapticsFeedbackView: View {
    
    var body: some View {
        VStack {
            Text("Notification Feedback types")
                .bold()
            HStack {
                Button("Success") {
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
                }
                .modifiedButtonStyle(color: Color(custom: .customGreen), textColor: .white)
                Button("Error") {
                    UINotificationFeedbackGenerator().notificationOccurred(.error)
                }
                .modifiedButtonStyle(color: Color(custom: .customRed), textColor: .white)
                Button("Warning") {
                    UINotificationFeedbackGenerator().notificationOccurred(.warning)
                }
                .modifiedButtonStyle(color: Color(custom: .customYellow), textColor: .white)
            }
            Text("Impact Feedback types")
                .bold()
                .padding(.top, 30)
            HStack {
                Button("Heavy") {
                    UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Light") {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
            }
            HStack {
                
                Button("Medium") {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Rigid") {
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Soft") {
                    UIImpactFeedbackGenerator(style: .soft).impactOccurred()
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
            }
        }
        .navigationTitle("Haptics")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    HapticsFeedbackView()
}
