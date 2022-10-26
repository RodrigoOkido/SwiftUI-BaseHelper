//
//  HapticsViewModifiers.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 26/10/22.
//

import SwiftUI

// MARK: - Notifications Feedback Generator
struct HapticsNotificationsFeedback: ViewModifier {
    
    var style: UINotificationFeedbackGenerator.FeedbackType
    
    func addNotificationHapticFeedback(style: UINotificationFeedbackGenerator.FeedbackType) {
        let generateFeedback = UINotificationFeedbackGenerator()
        generateFeedback.notificationOccurred(style)
    }
    
    func body(content: Content) -> some View {

        content
            .onTapGesture {
                addNotificationHapticFeedback(style: style)
            }
    }
}

// MARK: - Impact Feedback Generator
struct HapticsImpactFeedback: ViewModifier {
    
    var style: UIImpactFeedbackGenerator.FeedbackStyle
    
    func addImpactHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generateFeedback = UIImpactFeedbackGenerator(style: style)
        generateFeedback.impactOccurred()
    }
    
    func body(content: Content) -> some View {

        content
            .onTapGesture {
                addImpactHapticFeedback(style: style)
            }
    }
}
