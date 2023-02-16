//
//  Income.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import Charts
import SwiftUI

enum Month: String, Plottable {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
}

struct Income: Identifiable {
    var id = UUID()
    var month: Month
    var income: Double
    var color: String
}
