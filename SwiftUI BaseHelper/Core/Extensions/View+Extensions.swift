import SwiftUI

// MARK: - View Modifiers creations
import DesignSystem

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
