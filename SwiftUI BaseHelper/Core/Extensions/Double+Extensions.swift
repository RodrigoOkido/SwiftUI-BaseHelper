//
//  Double+Extensions.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 20/03/24.
//

import Foundation

extension Double {

    /// Formats the `Double` value as a localized currency string.
    ///
    /// Uses `NumberFormatter` with `.currency` style, the device's current locale,
    /// and grouping separators (e.g. thousands). The number of decimal places is
    /// controlled by `fractionDigits`.
    ///
    /// - Parameter fractionDigits: Maximum number of fraction digits to display. Defaults to `2`.
    /// - Returns: A formatted currency string using the current locale (e.g. `"$1,234.56"` for `en_US`,
    ///   `"R$ 1.234,56"` for `pt_BR`), or an empty string if formatting fails.
    ///
    /// - Example:
    ///   ```swift
    ///   let price = 1234.5
    ///   price.getCurrencyFormatted()        // "$1,234.50" (en_US)
    ///   price.getCurrencyFormatted(fractionDigits: 0) // "$1,235" (en_US)
    ///   ```
    func getCurrencyFormatted(fractionDigits: Int = 2) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = .current
        currencyFormatter.maximumFractionDigits = fractionDigits
        currencyFormatter.usesGroupingSeparator = true
        return currencyFormatter.string(from: NSNumber(value: self)) ?? ""
    }

    /// Convert a Double value into a String describing the time period of this value.
    /// ex: Double value 107170.15164256096 is converted to '1d 5h 46min'
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
