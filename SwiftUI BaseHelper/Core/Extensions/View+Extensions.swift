import SwiftUI

// MARK: - View Modifiers creations
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
}
