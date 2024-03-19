//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

class APIViewModel: ObservableObject {
    
    // MARK: - Stored Properties
    private var movieDBService: MovieDBRepositoryProtocol
    var requestFailedMessage: String

    // MARK: - Property Wrappers
    @Published var popularMovies: [Movie]
    @Published var requestFailed = false

    // MARK: - Initializer
    init(popularMovies: [Movie] = [], 
         requestFailedMessage: String = "",
         movieDBService: MovieDBRepositoryProtocol = MovieDBRepository(network: CoreNetwork())) {
        self.popularMovies = popularMovies
        self.movieDBService = movieDBService
        self.requestFailedMessage = requestFailedMessage
    }

    
    // MARK: - API Request
    func requestPopularMovies() async throws -> [Movie] {

        let response = await movieDBService.getMovies()

        switch response {
        case .success(let data):
            popularMovies = data
            return popularMovies
        case .failure(let error):
            requestFailed = true
            requestFailedMessage = error.errorMessage ?? "Unknown error"
            return []
        }
    }

    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        let url_poster_image = "https://image.tmdb.org/t/p/w500\(posterPath)"
        return url_poster_image
    }}
