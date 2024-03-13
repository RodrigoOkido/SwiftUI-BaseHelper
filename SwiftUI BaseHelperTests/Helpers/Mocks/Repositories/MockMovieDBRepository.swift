//
//  MockMovieDBRepository.swift
//  SwiftUI BaseHelperTests
//
//  Created by Rodrigo Okido on 13/03/24.
//

import Foundation
@testable import SwiftUI_BaseHelper

public class MockMovieDBRepository: MovieDBRepositoryProtocol {

    // MARK: - Network Methods
    public enum Methods {
        case getMovies
    }

    // MARK: - Stored Properties
    private let network: CoreNetworkProtocol
    public var calledMethods: [Methods] = []
    public var requestShouldFail: Bool = false

    // MARK: - Initializer
    public init(network: CoreNetworkProtocol) {
        self.network = network
    }
}

extension MockMovieDBRepository {

    public func createMockRemoteMovies() -> [RemoteMovie] {

        var mockedRemoteMovies: [RemoteMovie] = []
        mockedRemoteMovies.append(TestMovieFactory.makeRemoteMovie(id: 870))
        mockedRemoteMovies.append(TestMovieFactory.makeRemoteMovie(id: 910))
        return mockedRemoteMovies
    }

    public func getMovies() async -> Result<[Movie], RequestError> {

        calledMethods.append(.getMovies)
        let response: RemoteMovies = RemoteMovies(results: createMockRemoteMovies())
        let error: NetworkRequestError = NetworkRequestError(statusCode: 400, 
                                                             error: "Test failed successfully")

        let requestResponseSuccess: RequestResponse<RemoteMovies, NetworkRequestError> = .success(response)
        let requestResponseFail: RequestResponse<RemoteMovies, NetworkRequestError> = .failure(error)

        return ResponseHandler.handle(mapper: MoviesMapper(), 
                                      response: requestShouldFail ? requestResponseFail : requestResponseSuccess)
    }
}
