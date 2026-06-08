//
//  Time.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 08/06/26.
//
import Foundation

/// Helper class to provide the time in seconds for many time situations.
class TimeInSeconds {
    static let SECONDS: Double = 1
    static let MINUTES: Double = 60
    static let HOUR: Double = TimeInSeconds.MINUTES * 60
    static let DAY: Double = TimeInSeconds.HOUR * 24
    static let WEEK: Double = TimeInSeconds.DAY * 7
    static let MONTH: Double = TimeInSeconds.WEEK * 4.5
    static let YEAR: Double = TimeInSeconds.MONTH * 12
}

/// Class used for timers.
class TimerInMinutes {
    static let FIVE_MINUTES: Double = 5 * TimeInSeconds.MINUTES
    static let FIFTEEN_MINUTES: Double = 15 * TimeInSeconds.MINUTES
    static let THIRTY_MINUTES: Double = 30 * TimeInSeconds.MINUTES
    static let ONE_HOUR: Double = TimeInSeconds.HOUR
    static let THREE_HOURS: Double = 3 * TimeInSeconds.HOUR
}
