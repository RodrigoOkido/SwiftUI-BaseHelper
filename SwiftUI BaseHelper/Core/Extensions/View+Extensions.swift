import SwiftUI

// MARK: - View Modifiers creations

// Components modifers
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

// Loader Modifier
extension View {
    
    func onLoading(_ status: Binding<Bool>) -> some View {
        modifier(LoaderModifier(status))
    }
}


#Preview {
    LabelView()
        .onLoading(.constant(true))
}
