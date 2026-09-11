//
//  APIViewModelTests.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 11/09/26.
//

import Testing
@testable import SwiftUI_BaseHelper

@Suite("APIViewModel unit tests")
struct APIViewModelTests {

    @Test("Test: Constructing the view model should not require the dependency container")
    func test_init_WhenNoRepositoryIsInjected_ShouldNotResolveFromContainer() {

        let viewModel = APIViewModel()

        #expect(viewModel.popularMovies.isEmpty)
        guard case .loading = viewModel.viewState else {
            Issue.record("Initial state should be .loading")
            return
        }
    }

    @Test("Test: When the repository succeeds, should publish the movies and the loaded state")
    func test_requestPopularMovies_WhenRepositorySucceeds_ShouldPublishMoviesAndLoadedState() async throws {

        let (repository, viewModel) = makeSUT()

        try await viewModel.requestPopularMovies()

        #expect(viewModel.popularMovies.map(\.id) == [870, 910])
        #expect(repository.calledMethods == [.getMovies])
        guard case .loaded = viewModel.viewState else {
            Issue.record("State should be .loaded")
            return
        }
    }

    @Test("Test: When the repository fails, should publish the error state and keep the list untouched")
    func test_requestPopularMovies_WhenRepositoryFails_ShouldPublishErrorStateAndKeepList() async throws {

        let (repository, viewModel) = makeSUT()
        repository.requestShouldFail = true

        try await viewModel.requestPopularMovies()

        #expect(viewModel.popularMovies.isEmpty)
        guard case .error(let error) = viewModel.viewState else {
            Issue.record("State should be .error")
            return
        }
        #expect((error as? DomainError)?.kind == .badRequest)
    }

    @Test("Test: The error message shown to the user should come from the domain error")
    func test_getRequestErrorMessage_WhenErrorIsDomainError_ShouldReturnItsMessage() {

        let (_, viewModel) = makeSUT()
        let error = DomainError(kind: .notFound, message: "Nothing here")

        #expect(viewModel.getRequestErrorMessage(from: error) == "Nothing here")
    }

    @Test("Test: A domain error without message should fall back to a generic one")
    func test_getRequestErrorMessage_WhenDomainErrorHasNoMessage_ShouldReturnFallback() {

        let (_, viewModel) = makeSUT()

        #expect(viewModel.getRequestErrorMessage(from: DomainError(kind: .undefined)) == "Unknown error")
    }
}

// MARK: - Helper methods
extension APIViewModelTests {

    func makeSUT() -> (MockMovieDBRepository, APIViewModel) {
        let repository = MockMovieDBRepository(network: NetworkMock())
        let viewModel = APIViewModel(movieDBService: repository)
        return (repository, viewModel)
    }
}
