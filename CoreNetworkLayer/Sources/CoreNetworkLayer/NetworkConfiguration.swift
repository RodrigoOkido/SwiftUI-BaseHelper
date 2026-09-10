//
//  NetworkConfiguration.swift
//  CoreNetworkLayer
//
//  Created by Rodrigo Okido on 09/09/26.
//

import Foundation

/// The host-application settings `CoreNetwork` needs in order to build a request.
///
/// Declaring this in the package — instead of reaching for the app's `EnvironmentProtocol` —
/// is what keeps `CoreNetworkLayer` free of the app's dependency container. The app conforms
/// its own environment type to it, so the package never learns where `baseURL` comes from.
public protocol NetworkConfiguration: Sendable {

    var baseURL: String { get }
}
