//
//  RequestResponse.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

enum RequestResponse<D: Codable, E: Codable & Error> {

    case success(D)
    case customError(E)
    case failure(NetworkRequestError)
}
