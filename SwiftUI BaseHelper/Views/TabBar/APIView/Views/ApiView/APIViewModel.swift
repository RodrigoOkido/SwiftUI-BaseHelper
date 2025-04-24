//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

enum ViewState {
    case loading
    case loaded
    case error
}

class APIViewModel: ObservableObject {
    
    // MARK: - Stored Properties
    private var movieDBService: MovieDBRepositoryProtocol
    var requestFailedMessage: String
    var popularMovies: [Movie]

    // MARK: - Property Wrappers
    @Published var requestFailed = false
    @Published var viewState: ViewState = .loading

    // MARK: - Initializer
    init(popularMovies: [Movie] = [], 
         requestFailedMessage: String = "",
         movieDBService: MovieDBRepositoryProtocol = MovieDBRepository()) {
        self.popularMovies = popularMovies
        self.movieDBService = movieDBService
        self.requestFailedMessage = requestFailedMessage
    }

    
    // MARK: - API Request
    @MainActor
    func requestPopularMovies() async throws {
        viewState = .loading
        let response = await movieDBService.getMovies()

        switch response {
        case .success(let data):
            popularMovies = data
            viewState = .loaded
        case .failure(let error):
            requestFailedMessage = error.errorMessage ?? "Unknown error"
            requestFailed = true
            viewState = .error
        }
    }

    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        let url_poster_image = "https://image.tmdb.org/t/p/w500\(posterPath)"
        return url_poster_image
    }}
