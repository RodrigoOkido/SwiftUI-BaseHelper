//
//  Double+Extensions.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 20/03/24.
//

import Foundation

extension Double {

    func getCurrencyFormatted(fractionDigits: Int = 2) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .current
        currencyFormatter.maximumFractionDigits = fractionDigits
        currencyFormatter.usesGroupingSeparator = true
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
