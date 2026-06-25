//
//  Color+Extensions.swift
//  DesignSystem
//
//  Created by Rodrigo Okido on 24/06/26.
//

import UIKit
import SwiftUI

extension Color {

    static func adaptive(light: UIColor, dark: UIColor) -> Color {
        Color(UIColor { traits in
            traits.userInterfaceStyle == .dark ? dark : light
        })
    }
}
