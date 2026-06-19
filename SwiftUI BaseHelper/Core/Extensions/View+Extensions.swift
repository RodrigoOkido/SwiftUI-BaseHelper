import SwiftUI

// MARK: - View Modifiers creations
import DesignSystem

// Components modifers
extension View {
    
    func modifiedTextStyle(font: Font = .system(size: 21), 
                           color: Color = .blue) -> some View {
        modifier(ModifiedText(font: font, color: color))
    }
}

// Loader Modifier
extension View {
    
    func onLoading(_ status: Binding<Bool>) -> some View {
        modifier(LoaderModifier(status))
    }
}

// Dynamic Sheet Modifier
extension View {
    
    func dynamicContentBasedSheet(_ height: Binding<CGFloat>) -> some View {
        modifier(DynamicSheetModifier(height: height))
    }
}

#Preview {
    TextFieldView()
        .onLoading(.constant(true))
}
