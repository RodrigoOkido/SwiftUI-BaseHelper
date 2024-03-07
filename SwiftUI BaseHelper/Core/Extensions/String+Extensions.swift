import Foundation

// MARK: - Computed Properties
extension String {

    var length: Int {
        return count
    }

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

    var onlyNumbersAndLetters: String {
        let okayChars = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890ãÃõÕâÂôÔéÉàÀ")
        return self.filter { okayChars.contains($0) }
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
