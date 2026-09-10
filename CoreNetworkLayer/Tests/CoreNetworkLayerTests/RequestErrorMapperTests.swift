//
//  RequestErrorMapperTests.swift
//  CoreNetworkLayerTests
//
//  Created by Rodrigo Okido on 10/09/26.
//

import Testing
@testable import CoreNetworkLayer

@Suite("RequestErrorMapper unit tests")
struct RequestErrorMapperTests {

    @Test("Test: Every status code should map to its error type",
          arguments: [(400, RequestErrorType.badRequest),
                      (401, RequestErrorType.unauthorized),
                      (403, RequestErrorType.forbidden),
                      (404, RequestErrorType.notFound),
                      (408, RequestErrorType.timeout),
                      (409, RequestErrorType.conflict),
                      (500, RequestErrorType.serverError),
                      (503, RequestErrorType.serverError),
                      (599, RequestErrorType.serverError),
                      (418, RequestErrorType.undefined),
                      (302, RequestErrorType.undefined)])
    func test_map_WhenGivenStatusCode_ShouldReturnMatchingErrorType(statusCode: Int,
                                                                    expected: RequestErrorType) {

        let result = RequestErrorMapper.map(NetworkRequestError(statusCode: statusCode))

        #expect(result.errorType == expected)
    }

    @Test("Test: Token error should win over the status code")
    func test_map_WhenIsTokenError_ShouldReturnTokenError() {

        let input = NetworkRequestError(statusCode: 404,
                                        error: "expired",
                                        isTokenError: true)

        let result = RequestErrorMapper.map(input)

        #expect(result.errorType == .tokenError)
        #expect(result.errorMessage == "expired")
    }

    @Test("Test: No status code should map to undefined")
    func test_map_WhenStatusCodeIsNil_ShouldReturnUndefined() {

        let result = RequestErrorMapper.map(NetworkRequestError(error: "no status"))

        #expect(result.errorType == .undefined)
        #expect(result.errorMessage == "no status")
    }

    @Test("Test: Server message should be forwarded to the domain error")
    func test_map_WhenServerSendsMessage_ShouldForwardIt() {

        let result = RequestErrorMapper.map(NetworkRequestError(statusCode: 400,
                                                                error: "Bad body"))

        #expect(result.errorMessage == "Bad body")
    }

    @Test("Test: Equality should compare the failure kind and ignore the message")
    func test_equality_WhenErrorTypesMatchButMessagesDiffer_ShouldBeEqual() {

        #expect(RequestError(errorType: .notFound, errorMessage: "a")
                == RequestError(errorType: .notFound, errorMessage: "b"))

        #expect(RequestError(errorType: .notFound) != RequestError(errorType: .conflict))
    }
}
