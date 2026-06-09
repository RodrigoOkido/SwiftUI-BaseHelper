//
//  ArrowStepShape.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 27/05/26.
//

import SwiftUI

/// Pentagon (first step) or hexagon (subsequent steps) arrow shape used by `ArrowStepsBar`.
struct ArrowStepShape: Shape {
    
    // MARK: - Public Properties
    
    /// Checks if the step is the first one.
    var isFirst: Bool

    /// Depth of the right-side arrow point and the matching left-side notch.
    let arrowDepth: CGFloat = 16

    // MARK: - Public Methods
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height

        if isFirst {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: w - arrowDepth, y: 0))
            path.addLine(to: CGPoint(x: w, y: h / 2))
            path.addLine(to: CGPoint(x: w - arrowDepth, y: h))
            path.addLine(to: CGPoint(x: 0, y: h))
        } else {
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: w - arrowDepth, y: 0))
            path.addLine(to: CGPoint(x: w, y: h / 2))
            path.addLine(to: CGPoint(x: w - arrowDepth, y: h))
            path.addLine(to: CGPoint(x: 0, y: h))
            path.addLine(to: CGPoint(x: arrowDepth, y: h / 2))
        }
        path.closeSubpath()
        return path
    }
}
