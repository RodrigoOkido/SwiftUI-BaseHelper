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
    public static var xxs: CGFloat = 16
    
    /// xs: Icon size of 20pt
    public static var xs: CGFloat = 20
    
    /// sm: Icon size of 24pt
    public static var sm: CGFloat = 24
    
    /// md: Icon size of 32pt
    public static var md: CGFloat = 32
    
    /// lg: Icon size of 56pt
    public static var lg: CGFloat = 56
    
    /// xl: Icon size of 72pt
    public static var xl: CGFloat = 72
    
    /// xxl: Icon size of 99pt
    public static var xxl: CGFloat = 99
    
    /// xxxl: Icon size of 132pt
    public static var xxxl: CGFloat = 132
    
    /// huge: Icon size of 150pt
    public static var huge: CGFloat = 150
}

public struct WidthSize {

    public static var nano: CGFloat = 4
    public static var xs: CGFloat = 20
    public static var sm: CGFloat = 36
    public static var md: CGFloat = 46
    public static var lg: CGFloat = 64
    public static var xl: CGFloat = 72
    public static var xxl: CGFloat = 96
    public static var xxxl: CGFloat = 110
    public static var huge: CGFloat = 150
    public static var giant: CGFloat = 280
}

public struct HeightSize {

    public static var nano: CGFloat = 4
    public static var xs: CGFloat = 20
    public static var sm: CGFloat = 36
    public static var md: CGFloat = 46
    public static var lg: CGFloat = 64
    public static var xl: CGFloat = 72
    public static var xxl: CGFloat = 96
    public static var xxxl: CGFloat = 110
    public static var huge: CGFloat = 150
    public static var giant: CGFloat = 300
    public static var titan: CGFloat = 360
}

public struct ActionButtonSize {

    public static var sm: CGFloat = 46
    public static var md: CGFloat = 56
    public static var lg: CGFloat = 64
    public static var xl: CGFloat = 72
}

/// CornerRadius to define how rounded the element or component should be.
public struct CornerRadius {

    /// none: CornerRadius of 0pt
    public static var none: CGFloat = 0
    
    /// quarck: CornerRadius of 4pt
    public static var quarck: CGFloat = 4
    
    /// sm: CornerRadius of 8pt
    public static var sm: CGFloat = 8
    
    /// md: CornerRadius of 16pt
    public static var md: CGFloat = 16
    
    /// lg: CornerRadius of 24pt
    public static var lg: CGFloat = 24
}

/// StackSpacing to define space between elements. eg: VStack, HStack
public struct StackSpacing {

    /// quarck: StackSpacing of 4pt
    public static var quarck: CGFloat = 4
    
    /// nano: StackSpacing of 8pt
    public static var nano: CGFloat = 8
    
    /// micro: StackSpacing of 12pt
    public static var micro: CGFloat = 12
    
    /// xxxs: StackSpacing of 16pt
    public static var xxxs: CGFloat = 16
    
    /// xxs: StackSpacing of 24pt
    public static var xxs: CGFloat = 24
    
    /// xs: StackSpacing of 32pt
    public static var xs: CGFloat = 32
    
    /// sm: StackSpacing of 40pt
    public static var sm: CGFloat = 40
    
    /// md: StackSpacing of 48pt
    public static var md: CGFloat = 48
    
    /// lg: StackSpacing of 56pt
    public static var lg: CGFloat = 56
    
    /// xl: StackSpacing of 64pt
    public static var xl: CGFloat = 64
    
    /// xxl: StackSpacing of 80pt
    public static var xxl: CGFloat = 80
    
    /// xxxl: StackSpacing of 120pt
    public static var xxxl: CGFloat = 120
    
    /// huge: StackSpacing of 160pt
    public static var huge: CGFloat = 160
    
    /// giant: StackSpacing of 200pt
    public static var giant: CGFloat = 200
}

public struct InlineSpacing {

    public static var quarck: CGFloat = 4
    public static var nano: CGFloat = 8
    public static var xxxs: CGFloat = 16
    public static var xxs: CGFloat = 24
    public static var xs: CGFloat = 32
    public static var sm: CGFloat = 40
    public static var md: CGFloat = 48
    public static var lg: CGFloat = 64
    public static var xl: CGFloat = 80
}

/// InsetSpacing. Same terminology as Paddings
public struct InsetSpacing {

    /// quarck: InsetSpacing of 4pt
    public static var quarck: CGFloat = 4
    
    /// nano: InsetSpacing of 8pt
    public static var nano: CGFloat = 8
    
    /// xxxs: InsetSpacing of 12pt
    public static var xxxs: CGFloat = 12
    
    /// xxs: InsetSpacing of 16pt
    public static var xxs: CGFloat = 16
    
    /// xs: InsetSpacing of 24pt
    public static var xs: CGFloat = 24
    
    /// md: InsetSpacing of 32pt
    public static var md: CGFloat = 32
    
    /// lg: InsetSpacing of 40pt
    public static var lg: CGFloat = 40
    
    /// xl: InsetSpacing of 72pt
    public static var xl: CGFloat = 72
}

/// OpacityLevel of a component
public struct OpacityLevel {

    /// solid: OpacityLevel 100%
    public static var solid: CGFloat = 1
    
    /// opaque: OpacityLevel 80%
    public static var opaque: CGFloat = 0.8
    
    /// medium: OpacityLevel 50%
    public static var medium: CGFloat = 0.5
    
    /// transparent: OpacityLevel 20%
    public static var transparent: CGFloat = 0.2
    
    /// invisible: OpacityLevel 0%
    public static var invisible: CGFloat = 0
}

public struct BorderWidth {

    public static var none: CGFloat = 0
    public static var hairline: CGFloat = 1
    public static var thin: CGFloat = 2
    public static var medium: CGFloat = 3
    public static var thick: CGFloat = 4
    public static var heavy: CGFloat = 8
}

