//
//  DateFormatTypes.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 30/07/24.
//
import Foundation

enum DateFormatTypes: String, CaseIterable {

    case isoDateTimeMilliSec
    case birthDateFormat
    case regular
    case localDate
    case localDateType2
    case localDateType3
    case isoDate

    // MARK: - Computed Properties
    var formatDescription : String {

        switch self {
        case .isoDateTimeMilliSec: return "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
        case .birthDateFormat: return "yyyy-MM-dd'T'HH:mm:ss"
        case .regular: return "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        case .localDate: return "yyyy-MM-dd"
        case .localDateType2: return "yyyy/MM/dd"
        case .localDateType3: return "dd/MM/yyyy"
        case .isoDate: return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        }
    }

    var type: String {
        switch self {

        case .isoDateTimeMilliSec:
            return "isoDateTimeMilliSec"
        case .birthDateFormat:
            return "birthDateFormat"
        case .regular:
            return "regular"
        case .localDate:
            return "localDate"
        case .isoDate:
            return "isoDate"
        case .localDateType2:
            return "localDateType2"
        case .localDateType3:
            return "localDateType3"
        }
    }
}
