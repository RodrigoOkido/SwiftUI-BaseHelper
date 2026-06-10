import SwiftUI

// MARK: - View Modifiers creations
import DesignSystem

// Components modifers
extension View {
    
    func modifiedTextStyle(font: Font = .system(size: 21), 
                           color: Color = .blue) -> some View {
        modifier(ModifiedText(font: font, color: color))
    }
    
    func modifiedButtonStyle(color: Color = .blue, 
                             textColor: Color = .black) -> some View {
        modifier(ButtonModifier(color: color, textColor: textColor))
    }
}

// Loader Modifier
extension View {
    
    func onLoading(_ status: Binding<Bool>) -> some View {
        modifier(LoaderModifier(status))
    }
}


#Preview {
    TextFieldView()
        .onLoading(.constant(true))
}
