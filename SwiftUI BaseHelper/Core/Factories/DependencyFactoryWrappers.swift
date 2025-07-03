//
//  DependencyFactoryWrappers.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 03/07/25.
//
import Foundation

/// Returns the registered class if it exists or the optional value
/// Example: @SafeInjected(opt: CoreNetwork()) var network: CoreNetworkProtocol
@propertyWrapper struct SafeInjected<T> {
    let factory = DependencyFactory.shared
    let opt: T

    /// Safe Injected initializer
    /// - Parameter opt: The model to return if there is no dependency registered for the given protocol
    init(opt: T) {
        self.opt = opt
    }

    var wrappedValue: T {
        factory.resolve(protocol: T.self, optionalResult: opt)
    }
}

/// Returns the registered class if it exists
/// BE SURE TO REGISTER BEFORE USE THIS ONE
/// Example: @Injected var network: CoreNetworkProtocol
@propertyWrapper struct Injected<T> {
    let factory = DependencyFactory.shared

    var wrappedValue: T {
        factory.resolve(protocol: T.self)!
    }
}
