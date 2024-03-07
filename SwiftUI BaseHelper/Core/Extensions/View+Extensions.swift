import SwiftUI

extension View {
    
    func modifiedTextStyle(font: Font = .system(size: 21), 
                           color: Color = .blue) -> some View {
        modifier(ModifiedText(font: font, color: color))
    }
    
    func modifiedButtonStyle(color: Color = .blue, 
                             textColor: Color = .black) -> some View {
        modifier(ModifiedButton(color: color, textColor: textColor))
    }
    
    func modifiedTextfieldStyle(borderColor: Color = .blue) -> some View {
        modifier(ModifiedTextField(borderColor: borderColor))
    }
    
    func addNotificationHapticFeedback(style: UINotificationFeedbackGenerator.FeedbackType) {
        let generateFeedback = UINotificationFeedbackGenerator()
        generateFeedback.notificationOccurred(style)
    }
    
    func addImpactHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generateFeedback = UIImpactFeedbackGenerator(style: style)
        generateFeedback.impactOccurred()
    }
}
