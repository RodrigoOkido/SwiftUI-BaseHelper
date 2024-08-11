//
//  Date+Extensions.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 10/08/24.
//

import Foundation

extension Date {

    init(milliseconds: Double) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }

    var isNewYearsDay: Bool {
        return Calendar.current.isDate(self, equalTo: self.startOfYear, toGranularity: .day)
    }

    var isYesterday: Bool {
        return Calendar.current.isDateInYesterday(self)
    }

    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }

    var isTomorrow: Bool {
        return Calendar.current.isDateInTomorrow(self)
    }

    var isWithinLast48Hours: Bool {
        return Date.current.last48Hours < self
    }

    var isWithinLast24Hours: Bool {
        return Date.current.last24Hours < self
    }

    var isLastWeek: Bool {
        return Calendar.current.isDate(self, equalTo: Date.current.lastWeek, toGranularity: .weekOfYear)
    }

    var isThisWeek: Bool {
        return Calendar.current.isDate(self, equalTo: Date.current, toGranularity: .weekOfYear)
    }

    var isLastMonth: Bool {
        return Calendar.current.isDate(self, equalTo: Date.current.lastMonth, toGranularity: .month)
    }

    var isWithinCurrentYear: Bool {
        return Calendar.current.isDate(self, equalTo: Date.current, toGranularity: .year)
    }

    var last48Hours: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: self) ?? self
    }

    var last24Hours: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self) ?? self
    }

    var lastWeek: Date {
        return Calendar.current.date(byAdding: .weekOfYear, value: -1, to: self) ?? self
    }

    var lastMonth: Date {
        return Calendar.current.date(byAdding: .month, value: -1, to: self) ?? self
    }

    var isInFuture: Bool {
        return self > Date.current
    }

    var isInPast: Bool {
        return self < Date.current
    }

    /// Adds (or subtracts with a negative value) a number of days from a date object
    func adding(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: self) ?? self
    }

    /// Adds (or subtracts with a negative value) a number of months from a date object
    func adding(months: Int) -> Date {
        return Calendar.current.date(byAdding: .month, value: months, to: self) ?? self
    }

    /// Adds (or subtracts with a negative value) a number of years from a date object
    func adding(years: Int) -> Date {
        return Calendar.current.date(byAdding: .year, value: years, to: self) ?? self
    }

    /// Adds (or subtracts with a negative value) a number of hours from a date object
    func adding(hours: Int) -> Date {
        return Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? self
    }

    /// Adds (or subtracts with a negative value) a number of minutes from a date object
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self) ?? self
    }

    /// Adds (or subtracts with a negative value) a number of seconds from a date object
    func adding(seconds: Int) -> Date {
        return Calendar.current.date(byAdding: .second, value: seconds, to: self) ?? self
    }

    /// Returns the shortened days of the week (e.g. Sun, Mon...)
    var shortWeekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self)
    }

    /// Returns the shortened days of the week (e.g. Sunday, Monday...)
    var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    /// Returns the current month name as a string (e.g. August)
    var monthName: String {
        return DateFormatter.monthNameFormatter.string(from: self)
    }

    /// Returns the year of the date as a string (e.g. 2023)
    var year: String {
        return DateFormatter.yearFormatter.string(from: self)
    }

    /// Returns a new Date object representing the start of the week represented by this Date object
    var startOfWeek: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) ?? Date.current
    }

    /// Returns a new Date object representing the start of the month represented by this Date object
    var startOfMonth: Date {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)

        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = 1

        return calendar.date(from: components) ?? Date.current
    }

    /// Returns a new Date object representing the end of the month represented by this Date object
    var endOfMonth: Date {

        let calendar = Calendar.current

        // Gets the range of days in the current month
        guard
            let range = calendar.range(of: .day, in: .month, for: self)
        else {
            return Date.current
        }

        // Gets the last day of the month
        let lastDay = range.upperBound - 1

        let year = calendar.component(.year, from: self)
        let month = calendar.component(.month, from: self)

        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = lastDay

        return calendar.date(from: components) ?? Date.current
    }

    // Returns Jan 1 of the current year
    var startOfYear: Date {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = 1
        dateComponents.day = 1
        return calendar.date(from: dateComponents) ?? Date.current
    }

    // Returns Dec 31 of the current year
    var endOfYear: Date {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: self)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = 12
        dateComponents.day = 31
        return calendar.date(from: dateComponents) ?? Date.current
    }

    /// Allows you to set the time of a date object.  The `hour` parameter is in 24-hour time
    func setTime(hour: Int, minute: Int = 0, second: Int = 0, timeZone: TimeZone? = nil) -> Date {
        let calendar = Calendar.current

        var dateComponents = calendar.dateComponents([.year, .month, .day], from: self)

        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second

        if let timeZone = timeZone {
            dateComponents.timeZone = timeZone
        }

        return calendar.date(from: dateComponents) ?? self
    }

    /// A convenience helper to set the time to midnight without needing to set
    /// the hour, minute, and second explicitly every time.
    func atMidnight() -> Date {
        return self.setTime(hour: 0, minute: 0, second: 0)
    }

    /// Allows you to all the components of a date object.  The `hour` parameter is in 24-hour time
    func setDateTime(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int = 0, timeZone: TimeZone? = nil) -> Date {
        let calendar = Calendar.current

        var dateComponents = DateComponents()

        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second

        if let timeZone = timeZone {
            dateComponents.timeZone = timeZone
        }

        return calendar.date(from: dateComponents) ?? self
    }

    func getHoursOfDate() -> Int {
        return Calendar.current.component(.hour, from: self)
    }

    func getMinutesOfDate() -> Int {
        return Calendar.current.component(.minute, from: self)
    }

    func getCurrentDateWithHoursAndMinutes() -> Date {
        return Date.current.setTime(hour: self.getHoursOfDate(), minute: self.getMinutesOfDate())
    }

    /// Default start and end time for setting a device action as a trigger
    static var defaultStartTime: String = DateFormatter.timeFormatter.string(
        from: Calendar.current.date(from: DateComponents(hour: 0, minute: 0)) ?? Date.current
    )
    static var defaultEndTime: String = DateFormatter.timeFormatter.string(
        from: Calendar.current.date(from: DateComponents(hour: 23, minute: 59)) ?? Date.current
    )
}



/// This is what `Date.current` ends up returning.
/// By default, it will simply behave just like `Date()` or `Date.now`.
internal var dateCurrentImpl: () -> Date = {
    return { return Date() }
}()

/// This is meant to replace `Date()` and `Date.now` with `Date.current`
/// It allows us to use `Date.current` normally in our app, and then use it in testing with a static date.
///
/// To use it for testing, simply assign a static date to `dateCurrentImpl` like so:
///```
/// dateCurrentImpl = {
///     return Date(timeIntervalSinceReferenceDate: 536500800) // 1 January 2018, 12:00GMT
/// }
///```
///
/// See `TimedEventInfoTests.swift` for an example of how to use `Date.current` to test date and time functionality.
public extension Date {
    /// Return current date.
    /// Use `Date.current` instead of `Date()` or `Date.now`
    static var current: Date {
        return dateCurrentImpl()
    }
}

