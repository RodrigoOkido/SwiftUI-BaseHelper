//
//  MovieDBRepository.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation
import CoreNetworkLayer

public class MovieDBRepository: MovieDBRepositoryProtocol {

    // MARK: - Private Properties
    private let network: CoreNetworkProtocol
    private let apiKey: String

    // MARK: - Initializer
    public init(network: CoreNetworkProtocol, apiKey: String) {
        self.network = network
        self.apiKey = apiKey
    }

    func getMovies() async -> Result<[Movie], RequestError> {

        let requestResponse = await network.request(endpoint: MovieDBEndpoint.getMovies,
                                                    method: .GET,
                                                    interceptors: [MovieDBInterceptor(apiKey: apiKey)],
                                                    responseType: RemoteMovies.self,
                                                    errorType:  NetworkRequestError.self)

        return ResponseHandler.handle(mapper: MoviesMapper(), response: requestResponse)
    }
}
