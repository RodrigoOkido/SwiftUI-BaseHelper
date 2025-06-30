import Foundation

// MARK: - Computed Properties
extension String {

    var length: Int {
        return count
    }

    @available(*, deprecated, message: "Use Localizable.xcstrings instead")
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    var isValidEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    var onlyNumbers: String {
        let okayChars = Set("1234567890")
        return self.filter { okayChars.contains($0) }
    }

    var onlyNumbersAndPuntuaction: String {
        let okayChars = Set("1234567890.,")
        return self.filter { okayChars.contains($0) }
    }

    var onlyNumbersAndLetters: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890ãÃõÕâÂôÔéÉàÀ")
        return self.filter { okayChars.contains($0) }
    }

    var isValidPassword: Bool {
        let regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9]).{6,}$"
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

// MARK: - Substring
extension String {

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
}

// MARK: - Subscripts
extension String {

    subscript(range: Range<Int>) -> String {
        let newRange = Range(uncheckedBounds: (lower: max(0, min(length, range.lowerBound)),
                                               upper: min(length, max(0, range.upperBound))))
        let start = index(startIndex, offsetBy: newRange.lowerBound)
        let end = index(start, offsetBy: newRange.upperBound - newRange.lowerBound)
        return String(self[start ..< end])
    }

    subscript(index: Int) -> String {
        return self[index ..< index + 1]
    }
}

// MARK: - File extension
enum FileExtension: String, CaseIterable {

    case JPEG
    case JPG
    case PNG
    case PDF
    case MP4
    case MOV
    case MKV
}

extension String {

    var getFileExtension: FileExtension? {
        let fileExtension = self.components(separatedBy: ".").last
        return FileExtension.allCases.first {
            $0.rawValue == fileExtension?.uppercased()
        } ?? nil
    }

    var asDate: Date? {
        var date: Date?
        let types: [DateFormatTypes] = DateFormatTypes.allCases
        let dateFormatter = DateFormatter.formatter
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        for type in types {
            dateFormatter.dateFormat = type.formatDescription
            date = dateFormatter.date(from: self)
            if let date {
                return date
            }
        }
        return nil
    }
}
