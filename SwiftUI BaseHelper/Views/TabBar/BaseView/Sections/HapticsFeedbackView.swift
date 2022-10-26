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
                    addNotificationHapticFeedback(style: .success)
                }
                .modifiedButtonStyle(color: Color(custom: .customGreen), textColor: .white)
                Button("Error") {
                    addNotificationHapticFeedback(style: .error)
                }
                .modifiedButtonStyle(color: Color(custom: .customRed), textColor: .white)
                Button("Warning") {
                    addNotificationHapticFeedback(style: .warning)
                }
                .modifiedButtonStyle(color: Color(custom: .customYellow), textColor: .white)
            }
            Text("Impact Feedback types")
                .bold()
                .padding(.top, 30)
            HStack {
                Button("Heavy") {
                    addImpactHapticFeedback(style: .heavy)
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Light") {
                    addImpactHapticFeedback(style: .light)
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
            }
            HStack {
                
                Button("Medium") {
                    addImpactHapticFeedback(style: .medium)
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Rigid") {
                    addImpactHapticFeedback(style:.rigid)
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
                Button("Soft") {
                    addImpactHapticFeedback(style: .soft)
                }
                .modifiedButtonStyle(color: Color(custom: .customPurple), textColor: .white)
            }
        }
        .navigationTitle("Haptics")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct HapticsFeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        HapticsFeedbackView()
    }
}
