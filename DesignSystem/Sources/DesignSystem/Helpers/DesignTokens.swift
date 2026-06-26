//
//  DesignTokens.swift
//
//
//  Created by Rodrigo Okido on 18/03/24.
//

import Foundation

/// IconSize. Define the size of icons within the app
public struct IconSize {

    /// nano: Icon size of 16pt
    public static let xxs: CGFloat = 16
    
    /// xs: Icon size of 20pt
    public static let xs: CGFloat = 20
    
    /// sm: Icon size of 24pt
    public static let sm: CGFloat = 24
    
    /// md: Icon size of 32pt
    public static let md: CGFloat = 32
    
    /// lg: Icon size of 56pt
    public static let lg: CGFloat = 56
    
    /// xl: Icon size of 72pt
    public static let xl: CGFloat = 72
    
    /// xxl: Icon size of 99pt
    public static let xxl: CGFloat = 99
    
    /// xxxl: Icon size of 132pt
    public static let xxxl: CGFloat = 132
    
    /// huge: Icon size of 150pt
    public static let huge: CGFloat = 150
}

/// Some usual applications Width sizes
public struct WidthSize {

    /// xxxs:  Width size of 16pt
    public static let xxxs: CGFloat = 16
    
    /// xxs:  Width size of 32pt
    public static let xxs: CGFloat = 32
    
    /// xs:  Width size of 48pt
    public static let xs: CGFloat = 48
    
    /// sm:  Width size of 64pt
    public static let sm: CGFloat = 64
    
    /// md:  Width size of 128pt
    public static let md: CGFloat = 128
    
    /// lg:  Width size of 160pt
    public static let lg: CGFloat = 160
    
    /// xl:  Width size of 180pt
    public static let xl: CGFloat = 180
    
    /// xxl:  Width size of 220pt
    public static let xxl: CGFloat = 220
    
    /// xxxl:  Width size of 250pt
    public static let xxxl: CGFloat = 250
    
    /// huge:  Width size of 200pt
    public static let huge: CGFloat = 300
    
    /// giant:  Width size of 350pt
    public static let giant: CGFloat = 350
    
    /// titan:  Width size of 400pt
    public static let titan: CGFloat = 400
}

/// Some usual applications Height sizes
public struct HeightSize {

    /// xxxs:  Height size of 16pt
    public static let xxxs: CGFloat = 16
    
    /// xxs:  Height size of 32pt
    public static let xxs: CGFloat = 32
    
    /// xs:  Height size of 48pt
    public static let xs: CGFloat = 48
    
    /// sm:  Height size of 64pt
    public static let sm: CGFloat = 64
    
    /// md:  Height size of 128pt
    public static let md: CGFloat = 128
    
    /// lg:  Height size of 160pt
    public static let lg: CGFloat = 160
    
    /// xl:  Height size of 180pt
    public static let xl: CGFloat = 180
    
    /// xxl:  Height size of 220pt
    public static let xxl: CGFloat = 220
    
    /// xxxl:  Height size of 250pt
    public static let xxxl: CGFloat = 250
    
    /// huge:  Height size of 200pt
    public static let huge: CGFloat = 300
    
    /// giant:  Height size of 350pt
    public static let giant: CGFloat = 350
    
    /// titan:  Height size of 400pt
    public static let titan: CGFloat = 400
}

/// CornerRadius to define how rounded the element or component should be.
public struct CornerRadius {

    /// none: CornerRadius of 0pt
    public static let none: CGFloat = 0
    
    /// quark: CornerRadius of 2pt
    public static let quark: CGFloat = 2
    
    /// nano: CornerRadius of 4pt
    public static let nano: CGFloat = 4
    
    /// xs: CornerRadius of 8pt
    public static let xxs: CGFloat = 8
    
    /// xs: CornerRadius of 10pt
    public static let xs: CGFloat = 10
    
    /// xs: CornerRadius of 12pt
    public static let sm: CGFloat = 12
    
    /// md: CornerRadius of 16pt
    public static let md: CGFloat = 16
    
    /// lg: CornerRadius of 20pt
    public static let lg: CGFloat = 20
    
    /// xl: CornerRadius of 24pt
    public static let xl: CGFloat = 24
}

/// StackSpacing to define space between elements. eg: VStack, HStack
public struct StackSpacing {

    /// quark: StackSpacing of 2pt
    public static let quark: CGFloat = 2
    
    /// nano: StackSpacing of 4pt
    public static let nano: CGFloat = 4
    
    /// micro: StackSpacing of 8pt
    public static let micro: CGFloat = 8
    
    /// xxs: StackSpacing of 10pt
    public static let xxs: CGFloat = 10
    
    /// xs: StackSpacing of 12pt
    public static let xs: CGFloat = 12
    
    /// sm: StackSpacing of 14pt
    public static let sm: CGFloat = 14
    
    /// md: StackSpacing of 16pt
    public static let md: CGFloat = 16
    
    /// lg: StackSpacing of 20pt
    public static let lg: CGFloat = 20
    
    /// xl: StackSpacing of 24pt
    public static let xl: CGFloat = 24
    
    /// xxl: StackSpacing of 28pt
    public static let xxl: CGFloat = 28
    
    /// xxxl: StackSpacing of 32pt
    public static let xxxl: CGFloat = 32
    
    /// huge: StackSpacing of 64pt
    public static let huge: CGFloat = 64
    
    /// giant: StackSpacing of 128pt
    public static let giant: CGFloat = 128
}

public struct InlineSpacing {

    /// quark: InlineSpacing of 1pt
    public static let quark: CGFloat = 1
    
    /// nano: InlineSpacing of 2pt
    public static let nano: CGFloat = 2
    
    /// xs: InlineSpacing of 4pt
    public static let xs: CGFloat = 4
    
    /// sm: InlineSpacing of 6pt
    public static let sm: CGFloat = 6
    
    /// md: InlineSpacing of 10pt
    public static let md: CGFloat = 10
    
    /// lg: InlineSpacing of 14pt
    public static let lg: CGFloat = 14
    
    /// xl: InlineSpacing of 18pt
    public static let xl: CGFloat = 18
}

/// InsetSpacing. Same terminology as Paddings
public struct InsetSpacing {

    /// quark: InsetSpacing of 2pt
    public static let quark: CGFloat = 2
    
    /// nano: InsetSpacing of 4pt
    public static let nano: CGFloat = 4
    
    /// xxs: InsetSpacing of 8pt
    public static let xxs: CGFloat = 8
    
    /// xs: InsetSpacing of 10pt
    public static let xs: CGFloat = 10
    
    /// sm: InsetSpacing of 12pt
    public static let sm: CGFloat = 12
    
    /// md: InsetSpacing of 16pt
    public static let md: CGFloat = 16
    
    /// lg: InsetSpacing of 20pt
    public static let lg: CGFloat = 20
    
    /// xl: InsetSpacing of 24pt
    public static let xl: CGFloat = 24
}

/// OpacityLevel of a component
public struct OpacityLevel {

    /// solid: OpacityLevel 100%
    public static let solid: CGFloat = 1
    
    /// solid: OpacityLevel 90%
    public static let almostSolid: CGFloat = 0.9
    
    /// opaque: OpacityLevel 80%
    public static let opaque: CGFloat = 0.8
    
    /// medium: OpacityLevel 50%
    public static let medium: CGFloat = 0.5
    
    /// transparent: OpacityLevel 35%
    public static let semiTransparent: CGFloat = 0.35
    
    /// transparent: OpacityLevel 20%
    public static let transparent: CGFloat = 0.2
    
    /// invisible: OpacityLevel 0%
    public static let invisible: CGFloat = 0
}

/// BorderWidth of a component
public struct BorderWidth {

    /// none: Border width of 0
    public static let none: CGFloat = 0
    
    /// hairline: Border width of 0.5
    public static let hairline: CGFloat = 0.5
    
    /// thin: Border width of 1
    public static let thin: CGFloat = 1
    
    /// medium: Border width of 1.5
    public static let medium: CGFloat = 1.5
    
    /// thick: Border width of 2
    public static let thick: CGFloat = 2
    
    /// heavy: Border width of 4
    public static let heavy: CGFloat = 4
}

