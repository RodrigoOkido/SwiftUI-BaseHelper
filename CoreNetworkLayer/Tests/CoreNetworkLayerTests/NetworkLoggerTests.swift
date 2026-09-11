//
//  NetworkLoggerTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 11/09/26.
//

import Foundation
import Testing
@testable import CoreNetworkLayer

@Suite("NetworkLogger unit tests")
struct NetworkLoggerTests {

    @Test("Test: Query values should be masked but keys kept visible")
    func test_redactedURL_WhenURLHasQuery_ShouldMaskValuesAndKeepKeys() {

        let request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=SECRET&page=2")!)

        let logged = NetworkLogger.redactedURL(from: request)

        #expect(!logged.contains("SECRET"))
        #expect(!logged.contains("=2"))
        #expect(logged.hasPrefix("https://api.themoviedb.org/3/movie/popular?"))
        #expect(logged.contains("api_key="))
        #expect(logged.contains("page="))
    }

    @Test("Test: A URL without query should be logged unchanged")
    func test_redactedURL_WhenURLHasNoQuery_ShouldReturnItUnchanged() {

        let request = URLRequest(url: URL(string: "https://api.themoviedb.org/3/list")!)

        #expect(NetworkLogger.redactedURL(from: request) == "https://api.themoviedb.org/3/list")
    }

    @Test("Test: A nil request should log a placeholder")
    func test_redactedURL_WhenRequestIsNil_ShouldReturnPlaceholder() {
        #expect(NetworkLogger.redactedURL(from: nil) == "-")
    }
}
