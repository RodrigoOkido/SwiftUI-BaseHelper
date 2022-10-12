//
//  Color+Extensions.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import SwiftUI

enum CustomColor {
    case customBlue
    case customRed
    case customPurple
    case customOrange
    
    var colorDescription: String {
        switch self {
            case .customBlue:
                return "customBlue"
            case .customRed:
                return "customRed"
            case .customPurple:
                return "customPurple"
            case .customOrange:
                return "customOrange"
        }
    }
}

extension Color {
    
    init(custom: CustomColor) {
        self.init(custom.colorDescription)
    }
}
