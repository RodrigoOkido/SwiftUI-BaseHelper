//
//  HTTPVerb.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public enum HTTPVerb: String, Sendable {

    case DELETE
    case GET
    case PATCH
    case POST
    case PUT

    public var shouldUseQuery: Bool {
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

    public var shouldUseBody: Bool {
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
