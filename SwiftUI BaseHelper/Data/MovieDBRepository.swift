//
//  MovieDBRepository.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public class MovieDBRepository: MovieDBRepositoryProtocol {

    // MARK: - Stored Properties
    private let network: CoreNetworkProtocol

    public init(network: CoreNetworkProtocol) {
        self.network = network
    }

    func getMovies() async -> Result<[Movie], RequestError> {
        
        let requestResponse = await network.request(endpoint: MovieDBEndpoint.getMovies,
                                                    method: .GET,
                                                    interceptors: [MovieDBInterceptor()],
                                                    responseType: RemoteMovies.self,
                                                    errorType:  NetworkRequestError.self)

        return ResponseHandler.handle(mapper: MoviesMapper(), response: requestResponse)
    }
}
