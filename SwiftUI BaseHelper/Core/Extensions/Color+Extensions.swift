import Foundation
import SwiftUI

enum CustomColor {
    case customBlue
    case customRed
    case customPurple
    case customOrange
    case customGreen
    case customYellow
    
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
            case .customGreen:
                return "customGreen"
            case .customYellow:
                return "customYellow"
        }
    }
}

extension Color {
    
    init(custom: CustomColor) {
        self.init(custom.colorDescription)
    }
}
