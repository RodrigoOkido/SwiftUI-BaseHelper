//
//  MovieDBRepository.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

public class MovieDBRepository: MovieDBRepositoryProtocol {

    // MARK: - Dependencies
    @Injected var network: CoreNetworkProtocol

    func getMovies() async -> Result<[Movie], RequestError> {
        
        let requestResponse = await network.request(endpoint: MovieDBEndpoint.getMovies,
                                                    method: .GET,
                                                    interceptors: [MovieDBInterceptor()],
                                                    responseType: RemoteMovies.self,
                                                    errorType:  NetworkRequestError.self)

        return ResponseHandler.handle(mapper: MoviesMapper(), response: requestResponse)
    }
}
