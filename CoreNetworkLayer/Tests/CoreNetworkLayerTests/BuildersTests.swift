//
//  BuildersTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 10/09/26.
//

import Foundation
import Testing
@testable import CoreNetworkLayer

@Suite("QueryBuilder unit tests")
struct QueryBuilderTests {

    @Test("Test: An array value should repeat the key per element")
    func test_build_WhenValueIsAnArray_ShouldRepeatTheKey() {

        let items = QueryBuilder().build(parameters: ["genre_ids": [28, 12]])

        #expect(items.count == 2)
        #expect(items.allSatisfy { $0.name == "genre_ids" })
        #expect(Set(items.compactMap(\.value)) == ["28", "12"])
    }

    @Test("Test: A scalar value should produce a single item")
    func test_build_WhenValueIsScalar_ShouldProduceASingleItem() {

        let items = QueryBuilder().build(parameters: ["api_key": "abc"])

        #expect(items == [URLQueryItem(name: "api_key", value: "abc")])
    }

    @Test("Test: Empty parameters should produce no query items")
    func test_build_WhenParametersAreEmpty_ShouldReturnEmpty() {
        #expect(QueryBuilder().build(parameters: [:]).isEmpty)
    }
}

@Suite("InterceptorBuilder unit tests")
struct InterceptorBuilderTests {

    private struct HeaderInterceptor: RequestInterceptor {
        let name: String

        func adapt(request: URLRequest) async -> URLRequest {
            var request = request
            let previous = request.value(forHTTPHeaderField: "Order") ?? ""
            request.setValue(previous + name, forHTTPHeaderField: "Order")
            return request
        }
    }

    @Test("Test: Interceptors should be applied in order")
    func test_adapt_WhenGivenSeveralInterceptors_ShouldApplyThemInOrder() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await InterceptorBuilder().adapt(urlRequest: request,
                                                       interceptors: [HeaderInterceptor(name: "A"),
                                                                      HeaderInterceptor(name: "B"),
                                                                      HeaderInterceptor(name: "C")])

        #expect(adapted.value(forHTTPHeaderField: "Order") == "ABC")
    }

    @Test("Test: No interceptors should leave the request unchanged")
    func test_adapt_WhenNoInterceptors_ShouldReturnRequestUnchanged() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await InterceptorBuilder().adapt(urlRequest: request, interceptors: [])

        #expect(adapted == request)
    }

    @Test("Test: JSONInterceptor should set the content type")
    func test_adapt_WhenJSONInterceptor_ShouldSetContentType() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await JSONInterceptor().adapt(request: request)

        #expect(adapted.value(forHTTPHeaderField: "Content-Type") == "application/json")
    }
}

@Suite("RequestBuilder unit tests")
struct RequestBuilderTests {

    private let host = "https://api.themoviedb.org"

    @Test("Test: A verb that uses query should put parameters in the URL")
    func test_makeRequest_WhenVerbUsesQuery_ShouldPutParametersInTheURL() async {

        let request = await RequestBuilder().makeRequest(host: host,
                                                         path: "/3/movie/popular",
                                                         method: .GET,
                                                         parameters: ["page": 2],
                                                         interceptors: [])

        #expect(request?.url?.absoluteString == "\(host)/3/movie/popular?page=2")
        #expect(request?.httpBody == nil)
        #expect(request?.httpMethod == "GET")
    }

    @Test("Test: A verb that uses body should put parameters in the body")
    func test_makeRequest_WhenVerbUsesBody_ShouldPutParametersInTheBody() async {

        let request = await RequestBuilder().makeRequest(host: host,
                                                         path: "/3/list",
                                                         method: .POST,
                                                         parameters: ["name": "watchlist"],
                                                         interceptors: [])

        #expect(request?.url?.absoluteString == "\(host)/3/list")
        #expect(request?.httpMethod == "POST")

        let body = try? JSONSerialization.jsonObject(with: request?.httpBody ?? Data()) as? [String: Any]
        #expect(body?["name"] as? String == "watchlist")
    }

    @Test("Test: A path without a leading slash cannot build a request")
    func test_makeRequest_WhenPathIsInvalidForTheHost_ShouldReturnNil() async {

        let request = await RequestBuilder().makeRequest(host: host,
                                                         path: "3/movie/popular",
                                                         method: .GET,
                                                         parameters: [:],
                                                         interceptors: [])

        #expect(request == nil)
    }
}
