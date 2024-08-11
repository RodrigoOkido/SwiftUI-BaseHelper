import Foundation

// MARK: - Static Properties
extension DateFormatter {

    static let formatter = DateFormatter()
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

/// When adding new date formats, make sure you use setLocalizedDateFormatFromTemplate("dd MMMM")
/// and not .dateFormat = "dd MMMM" so that the system formats it correctly according to the
/// user's locale. (e.g. October 15 in English would be 15 oktober in Dutch)
extension DateFormatter {

    /// Formats a date like "Thu Oct 26 2023 14:33:45 GMT+0000 (Coordinated Universal Time)"
    /// This format is returned from the 3P onboarding device discovery APIs
    public static let expandedDateTimeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEE MMM dd yyyy HH:mm:ss 'GMT'Z (zzzz)")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the full date (e.g. January 8, 2023)
    public static let monthDayYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM d, yyyy")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the full date but with a short month (e.g. Jan 8, 2023)
    public static let monthDayYearShortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM d, yyyy")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the full month and day (e.g. January 31)
    public static let monthDayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM d")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the month abbreviation and day (e.g. Jan 31)
    public static let monthDayShortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM d")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the full name of the month (e.g. December)
    public static let monthNameFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMMM")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the short name of the month (e.g. Dec)
    public static let monthNameShortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("MMM")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the current date's number (e.g. if it's July 31st it'll return 31)
    public static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("d")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the abbreviated day of the week (e.g. "Mon", "Tue", etc.)
    public static let weekDayShortFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEE")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the day of the week (e.g. Mon, June 2)
    public static let dayOfWeekFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("E, MMMM d")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as the day of the week (e.g. Monday, June 2)
    public static let dayOfWeekLongFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEE, MMMM d")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the date as just the year (e.g. 2023)
    public static let yearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("yyyy")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Returns the current timezone offset in ISO 8601 format (e.g. -06:00)
    public static let timeZoneOffset: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("ZZZZZ")
        formatter.locale = Locale.autoupdatingCurrent
        return formatter
    }()

    /// Formats the time with am/pm if it's a 12 hour formatted locale (e.g. 11:45 pm or 23:45)
    public static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        let currentLocale = Locale.autoupdatingCurrent
        if currentLocale.is12HourFormat {
            formatter.setLocalizedDateFormatFromTemplate("h:mm a")
        } else {
            formatter.setLocalizedDateFormatFromTemplate("H:mm")
        }
        return formatter
    }()

    /// Formats the time with am/pm if it's a 12 hour formatted locale (e.g. 11 pm or 23h)
    public static let hourFormatter: DateFormatter = {
        let formatter = DateFormatter()
        let currentLocale = Locale.autoupdatingCurrent
        if currentLocale.is12HourFormat {
            formatter.setLocalizedDateFormatFromTemplate("h a")
        } else {
            formatter.dateFormat = "HH'h'"
        }
        return formatter
    }()
}

extension DateComponentsFormatter {

    /// Returns a format for hours:minutes:seconds like 2:32:40 but will drop the leading 0, so
    /// if there are zero hours left it'll return 34:23
    public static let dropLeadingHrMinSecFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropLeading
        return formatter
    }()

    /// Returns a format like: 1h 32m
    public static let upcomingCountdownFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute]
        return formatter
    }()

    /// Returns a format like: 1m 4s
    public static let videoDurationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }()

    /// Returns a format like: 1h 1m 4s
    public static let eventCountdownFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropLeading
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter
    }()

    /// Returns a format like: 1 hr, 32 min | 1 hr | 32 min
    public static let shortFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
}

public extension ISO8601DateFormatter{
    /// Formats a date like "20231102"
    static let yearMonthDayFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withYear, .withMonth, .withDay]
        return formatter
    }()

    /// Formats a date like "2023-11-02T00:00:00.000-00:00"
    static let extendedYearMonthDateTimeStampFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter
    }()

    /// Formats a date like "2023-04-03T14:16:58.962Z"
    static var internetDateTimeFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()
}

