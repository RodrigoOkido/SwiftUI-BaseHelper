//
//  Locale+Extension.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 10/08/24.
//

import Foundation

extension Locale {

    /// Returns true the user's current locale uses a 12 hour time format
    var is12HourFormat: Bool {
        let formatter = DateFormatter()
        formatter.locale = self
        formatter.setLocalizedDateFormatFromTemplate("j")
        let dateFormat = formatter.dateFormat ?? ""
        return dateFormat.contains("a")
    }
}
