import SwiftUI

extension View {
    
    /// Loader modifier. Can be used if you need to show loading state while your
    /// view is loading its content.
    func onLoading(_ status: Binding<Bool>) -> some View {
        modifier(LoaderModifier(status))
    }
    
    /// Dynamic sheet modifier. This sheet view will open based on the content size. If the
    /// content is big, .large with scrollview will be used.
    func dynamicContentBasedSheet(_ height: Binding<CGFloat>) -> some View {
        modifier(DynamicSheetModifier(height: height))
    }
}

#Preview {
    TextFieldView()
        .onLoading(.constant(true))
}
