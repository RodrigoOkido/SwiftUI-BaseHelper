//
//  Double+Extensions.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 20/03/24.
//

import Foundation

class TimeInSeconds {
    static let SECONDS: Double = 1
    static let MINUTES: Double = 60
    static let HOUR: Double = TimeInSeconds.MINUTES * 60
    static let DAY: Double = TimeInSeconds.HOUR * 24
    static let WEEK: Double = TimeInSeconds.DAY * 7
    static let MONTH: Double = TimeInSeconds.WEEK * 4.5
    static let YEAR: Double = TimeInSeconds.MONTH * 12
}

extension Double {

    func getCurrencyFormatted(fractionDigits: Int = 2) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .current
        currencyFormatter.maximumFractionDigits = fractionDigits
        currencyFormatter.usesGroupingSeparator = true
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    // Convert a Double value into a String describing the time period of this value.
    // ex: Double value 107170.15164256096 is converted to '1d 5h 46min'
    func getRuntimeBasedOnTimestamp() -> String {

        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .default
        formatter.allowedUnits = [.year, .month, .weekOfMonth, .day, .hour, .minute]

        let maxRuntimeTextFormat = self < TimeInSeconds.WEEK ? 3 : 4

        let result = formatter.string(from: self) ?? ""
        let times = result.components(separatedBy: " ")
        let runtime = times.prefix(maxRuntimeTextFormat).joined(separator: " ")
        return runtime
    }
}
