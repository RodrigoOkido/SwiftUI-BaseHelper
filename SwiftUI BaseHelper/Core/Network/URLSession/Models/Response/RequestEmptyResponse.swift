//
//  RequestEmptyResponse.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public enum RequestEmptyResponse<E: Codable & Error> {

    case success
    case customError(E)
    case failure(NetworkRequestError)
}
