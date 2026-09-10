//
//  BuildersTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 09/09/26.
//

import Foundation
import Testing
@testable import CoreNetworkLayer

@Suite("QueryBuilder unit tests")
struct QueryBuilderTests {

    @Test
    func test_build_whenValueIsAnArray_shouldRepeatTheKeyPerElement() {

        let items = QueryBuilder().build(parameters: ["genre_ids": [28, 12]])

        #expect(items.count == 2)
        #expect(items.allSatisfy { $0.name == "genre_ids" })
        #expect(Set(items.compactMap(\.value)) == ["28", "12"])
    }

    @Test
    func test_build_whenValueIsScalar_shouldProduceASingleItem() {

        let items = QueryBuilder().build(parameters: ["api_key": "abc"])

        #expect(items == [URLQueryItem(name: "api_key", value: "abc")])
    }

    @Test
    func test_build_whenParametersAreEmpty_shouldReturnEmpty() {
        #expect(QueryBuilder().build(parameters: [:]).isEmpty)
    }

    @Test("The Codable overload goes through the encoder it is handed")
    func test_build_whenGivenEncodable_shouldEncodeItsProperties() {

        struct Parameters: Codable {
            let page: Int
        }

        let items = QueryBuilder().build(parameters: Parameters(page: 3),
                                         encoder: JSONEncoder())

        #expect(items == [URLQueryItem(name: "page", value: "3")])
    }
}

@Suite("InterceptorBuilder unit tests")
struct InterceptorBuilderTests {

    private struct HeaderInterceptor: RequestInterceptor {
        let name: String

        func adapt(request: URLRequest) async -> URLRequest {
            var request = request
            // Appending rather than setting, so the final value records the visit order.
            let previous = request.value(forHTTPHeaderField: "Order") ?? ""
            request.setValue(previous + name, forHTTPHeaderField: "Order")
            return request
        }
    }

    @Test
    func test_adapt_shouldApplyInterceptorsInOrder() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await InterceptorBuilder().adapt(urlRequest: request,
                                                       interceptors: [HeaderInterceptor(name: "A"),
                                                                      HeaderInterceptor(name: "B"),
                                                                      HeaderInterceptor(name: "C")])

        #expect(adapted.value(forHTTPHeaderField: "Order") == "ABC")
    }

    @Test
    func test_adapt_whenNoInterceptors_shouldReturnRequestUnchanged() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await InterceptorBuilder().adapt(urlRequest: request, interceptors: [])

        #expect(adapted == request)
    }

    @Test
    func test_jsonInterceptor_shouldSetContentType() async {

        let request = URLRequest(url: URL(string: "https://example.com")!)

        let adapted = await JSONInterceptor().adapt(request: request)

        #expect(adapted.value(forHTTPHeaderField: "Content-Type") == "application/json")
    }
}

@Suite("RequestBuilder unit tests")
struct RequestBuilderTests {

    private let host = "https://api.themoviedb.org"

    @Test
    func test_makeRequest_whenVerbUsesQuery_shouldPutParametersInTheURL() async {

        let request = await RequestBuilder().makeRequest(host: host,
                                                         path: "/3/movie/popular",
                                                         method: .GET,
                                                         parameters: ["page": 2],
                                                         interceptors: [])

        #expect(request?.url?.absoluteString == "\(host)/3/movie/popular?page=2")
        #expect(request?.httpBody == nil)
        #expect(request?.httpMethod == "GET")
    }

    @Test
    func test_makeRequest_whenVerbUsesBody_shouldPutParametersInTheBody() async {

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

    @Test("A path without its leading slash cannot be combined with a host, so no request is built")
    func test_makeRequest_whenPathIsInvalidForTheHost_shouldReturnNil() async {

        let request = await RequestBuilder().makeRequest(host: host,
                                                         path: "3/movie/popular",
                                                         method: .GET,
                                                         parameters: [:],
                                                         interceptors: [])

        #expect(request == nil)
    }
}
