//
//  MovieDBRepositoryTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 12/03/24.
//

import Foundation
import Testing
import CoreNetworkLayer
@testable import SwiftUI_BaseHelper

@Suite("MovieDBRepository unit tests")
struct MovieDBRepositoryTests {

    @Test("Test: Initializing the repository should not touch the network")
    func test_init_WhenRepositoryStarts_ShouldNotCallNetwork() {

        let (network, _) = makeSUT()

        #expect(network.requestsCounter == 0)
    }

    @Test("Test: getMovies should request the popular movies endpoint with GET")
    func test_getMovies_WhenCalled_ShouldRequestPopularMoviesEndpointWithGET() async throws {

        let (network, repository) = makeSUT()
        network.stubbedJSON = try makeMoviesJSON(ids: [870])

        _ = await repository.getMovies()

        #expect(network.requestsCounter == 1)
        #expect(network.lastEndpointPath == "/3/movie/popular")
        #expect(network.lastMethod == .GET)
    }

    @Test("Test: getMovies should attach the MovieDB interceptor")
    func test_getMovies_WhenCalled_ShouldAttachMovieDBInterceptor() async throws {

        let (network, repository) = makeSUT()
        network.stubbedJSON = try makeMoviesJSON(ids: [870])

        _ = await repository.getMovies()

        #expect(network.lastInterceptors.contains { $0 is MovieDBInterceptor })
    }

    @Test("Test: When the API succeeds, should return the mapped movies in order")
    func test_getMovies_WhenAPICallIsSuccessful_ShouldReturnMappedMoviesInOrder() async throws {

        let (network, repository) = makeSUT()
        network.stubbedJSON = try makeMoviesJSON(ids: [870, 910])

        let result = await repository.getMovies()

        switch result {
        case .success(let movies):
            #expect(movies.map(\.id) == [870, 910])
            #expect(movies.first?.title == "Tropa de Elite")
        case .failure(let error):
            Issue.record("Request should succeed, got \(error)")
        }
    }

    @Test("Test: When the API fails, should return a domain error carrying the reason")
    func test_getMovies_WhenAPIFails_ShouldReturnDomainErrorWithReason() async {

        let (network, repository) = makeSUT()
        network.stubbedError = NetworkRequestError(statusCode: 400,
                                                   error: "Test failed successfully")

        let result = await repository.getMovies()

        switch result {
        case .success:
            Issue.record("Request should fail")
        case .failure(let error):
            #expect(error.kind == .badRequest)
            #expect(error.message == "Test failed successfully")
        }
    }

    @Test("Test: Every failing status code should map to its domain error kind",
          arguments: [(401, DomainError.Kind.tokenError),
                      (404, DomainError.Kind.notFound),
                      (500, DomainError.Kind.serverError)])
    func test_getMovies_WhenAPIFailsWithStatus_ShouldMapToDomainKind(statusCode: Int,
                                                                    expected: DomainError.Kind) async {

        let (network, repository) = makeSUT()
        network.stubbedError = NetworkRequestError(statusCode: statusCode,
                                                   isTokenError: statusCode == 401)

        let result = await repository.getMovies()

        guard case .failure(let error) = result else {
            Issue.record("Request should fail")
            return
        }
        #expect(error.kind == expected)
    }
}

// MARK: - Helper methods
extension MovieDBRepositoryTests {

    func makeSUT() -> (NetworkMock, MovieDBRepository) {
        let network = NetworkMock()
        let repository = MovieDBRepository(network: network)
        return (network, repository)
    }

    func makeMoviesJSON(ids: [Int]) throws -> Data {
        let remoteMovies = RemoteMovies(results: ids.map { TestMovieFactory.makeRemoteMovie(id: $0) })
        return try JSONEncoder().encode(remoteMovies)
    }
}
