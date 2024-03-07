//
//  HTTPVerb.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

enum HTTPVerb: String {

    case DELETE
    case GET
    case PATCH
    case POST
    case PUT

    var shouldUseQuery: Bool {
        switch self {
        case .GET:
            return true
        case .POST:
            return false
        case .PUT:
            return false
        case .PATCH:
            return false
        case .DELETE:
            return true
        }
    }

    var shouldUseBody: Bool {
        switch self {
        case .GET:
            return false
        case .POST:
            return true
        case .PUT:
            return true
        case .PATCH:
            return true
        case .DELETE:
            return false
        }
    }
}
