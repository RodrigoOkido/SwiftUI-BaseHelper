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

public struct WidthSize {

    public static let nano: CGFloat = 4
    public static let xs: CGFloat = 20
    public static let sm: CGFloat = 36
    public static let md: CGFloat = 46
    public static let lg: CGFloat = 64
    public static let xl: CGFloat = 72
    public static let xxl: CGFloat = 96
    public static let xxxl: CGFloat = 110
    public static let huge: CGFloat = 150
    public static let giant: CGFloat = 280
}

public struct HeightSize {

    public static let nano: CGFloat = 4
    public static let xs: CGFloat = 20
    public static let sm: CGFloat = 36
    public static let md: CGFloat = 46
    public static let lg: CGFloat = 64
    public static let xl: CGFloat = 72
    public static let xxl: CGFloat = 96
    public static let xxxl: CGFloat = 110
    public static let huge: CGFloat = 150
    public static let giant: CGFloat = 300
    public static let titan: CGFloat = 360
}

public struct ActionButtonSize {

    public static let sm: CGFloat = 46
    public static let md: CGFloat = 56
    public static let lg: CGFloat = 64
    public static let xl: CGFloat = 72
}

/// CornerRadius to define how rounded the element or component should be.
public struct CornerRadius {

    /// none: CornerRadius of 0pt
    public static let none: CGFloat = 0
    
    /// quarck: CornerRadius of 4pt
    public static let quarck: CGFloat = 4
    
    /// sm: CornerRadius of 8pt
    public static let sm: CGFloat = 8
    
    /// md: CornerRadius of 16pt
    public static let md: CGFloat = 16
    
    /// lg: CornerRadius of 24pt
    public static let lg: CGFloat = 24
}

/// StackSpacing to define space between elements. eg: VStack, HStack
public struct StackSpacing {

    /// quarck: StackSpacing of 4pt
    public static let quarck: CGFloat = 4
    
    /// nano: StackSpacing of 8pt
    public static let nano: CGFloat = 8
    
    /// micro: StackSpacing of 12pt
    public static let micro: CGFloat = 12
    
    /// xxxs: StackSpacing of 16pt
    public static let xxxs: CGFloat = 16
    
    /// xxs: StackSpacing of 24pt
    public static let xxs: CGFloat = 24
    
    /// xs: StackSpacing of 32pt
    public static let xs: CGFloat = 32
    
    /// sm: StackSpacing of 40pt
    public static let sm: CGFloat = 40
    
    /// md: StackSpacing of 48pt
    public static let md: CGFloat = 48
    
    /// lg: StackSpacing of 56pt
    public static let lg: CGFloat = 56
    
    /// xl: StackSpacing of 64pt
    public static let xl: CGFloat = 64
    
    /// xxl: StackSpacing of 80pt
    public static let xxl: CGFloat = 80
    
    /// xxxl: StackSpacing of 120pt
    public static let xxxl: CGFloat = 120
    
    /// huge: StackSpacing of 160pt
    public static let huge: CGFloat = 160
    
    /// giant: StackSpacing of 200pt
    public static let giant: CGFloat = 200
}

public struct InlineSpacing {

    public static let quarck: CGFloat = 4
    public static let nano: CGFloat = 8
    public static let xxxs: CGFloat = 16
    public static let xxs: CGFloat = 24
    public static let xs: CGFloat = 32
    public static let sm: CGFloat = 40
    public static let md: CGFloat = 48
    public static let lg: CGFloat = 64
    public static let xl: CGFloat = 80
}

/// InsetSpacing. Same terminology as Paddings
public struct InsetSpacing {

    /// quarck: InsetSpacing of 4pt
    public static let quarck: CGFloat = 4
    
    /// nano: InsetSpacing of 8pt
    public static let nano: CGFloat = 8
    
    /// xxxs: InsetSpacing of 12pt
    public static let xxxs: CGFloat = 12
    
    /// xxs: InsetSpacing of 16pt
    public static let xxs: CGFloat = 16
    
    /// xs: InsetSpacing of 24pt
    public static let xs: CGFloat = 24
    
    /// md: InsetSpacing of 32pt
    public static let md: CGFloat = 32
    
    /// lg: InsetSpacing of 40pt
    public static let lg: CGFloat = 40
    
    /// xl: InsetSpacing of 72pt
    public static let xl: CGFloat = 72
}

/// OpacityLevel of a component
public struct OpacityLevel {

    /// solid: OpacityLevel 100%
    public static let solid: CGFloat = 1
    
    /// opaque: OpacityLevel 80%
    public static let opaque: CGFloat = 0.8
    
    /// medium: OpacityLevel 50%
    public static let medium: CGFloat = 0.5
    
    /// transparent: OpacityLevel 20%
    public static let transparent: CGFloat = 0.2
    
    /// invisible: OpacityLevel 0%
    public static let invisible: CGFloat = 0
}

public struct BorderWidth {

    public static let none: CGFloat = 0
    public static let hairline: CGFloat = 1
    public static let thin: CGFloat = 2
    public static let medium: CGFloat = 3
    public static let thick: CGFloat = 4
    public static let heavy: CGFloat = 8
}

