//
//  Income.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import Charts
import SwiftUI

enum Month: String {
    case january = "January"
    case february = "February"
    case march = "March"
    case april = "April"
    case may = "May"
    case june = "June"
    case july = "July"
    case august = "August"
    case september = "September"
    case october = "October"
    case november = "November"
    case december = "December"
}

struct Income: Identifiable {
    var id = UUID()
    var month: String
    var income: Double
    var color: String
}

