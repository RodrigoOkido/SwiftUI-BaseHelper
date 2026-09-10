//
//  MovieDBInterceptorTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 09/09/26.
//

import Foundation
import Testing
import CoreNetworkLayer
@testable import SwiftUI_BaseHelper

@Suite("MovieDBInterceptor unit tests")
struct MovieDBInterceptorTests {

    private let apiKey = "test-api-key"

    @Test("Test: A request that already carries query items keeps them and gains the api_key")
    func test_adapt_whenRequestHasExistingQuery_shouldAppendApiKeyAndKeepTheRest() async {

        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?page=2")!

        let adapted = await MovieDBInterceptor(apiKey: apiKey).adapt(request: URLRequest(url: url))

        let items = queryItems(of: adapted)
        #expect(items["api_key"] == apiKey)
        #expect(items["page"] == "2")
    }

    /// Regression cover: the previous implementation appended through `queryItems?`, so a request
    /// built without any query items (any non-GET verb) silently lost the API key.
    @Test("Test: A request with no query items still gets the api_key")
    func test_adapt_whenRequestHasNoQuery_shouldStillAddApiKey() async {

        let url = URL(string: "https://api.themoviedb.org/3/list")!

        let adapted = await MovieDBInterceptor(apiKey: apiKey).adapt(request: URLRequest(url: url))

        #expect(queryItems(of: adapted)["api_key"] == apiKey)
    }

    @Test("Test: Building the popular movies request should produce the documented URL")
    func test_makeRequest_forGetMovies_shouldBuildPathAndApiKey() async {

        let request = await RequestBuilder().makeRequest(host: "https://api.themoviedb.org",
                                                         path: MovieDBEndpoint.getMovies.path,
                                                         method: .GET,
                                                         parameters: [:],
                                                         interceptors: [MovieDBInterceptor(apiKey: apiKey)])

        #expect(request?.url?.path() == "/3/movie/popular")
        #expect(queryItems(of: request).first(where: { $0.key == "api_key" })?.value == apiKey)
    }
}

// MARK: - Helpers
extension MovieDBInterceptorTests {

    private func queryItems(of request: URLRequest?) -> [String: String] {

        guard let url = request?.url,
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let items = components.queryItems else {
            return [:]
        }

        return items.reduce(into: [String: String]()) { result, item in
            result[item.name] = item.value
        }
    }
}
