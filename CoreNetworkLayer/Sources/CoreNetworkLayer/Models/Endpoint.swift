//
//  Endpoint.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public protocol Endpoint: Sendable {

    var path: String { get }
}
