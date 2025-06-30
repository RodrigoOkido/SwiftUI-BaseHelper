//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

class APIViewModel: BaseViewModel {
    
    // MARK: - Stored Properties
    private var movieDBService: MovieDBRepositoryProtocol
    var popularMovies: [Movie]

    // MARK: - Initializer
    init(popularMovies: [Movie] = [], 
         movieDBService: MovieDBRepositoryProtocol = MovieDBRepository()) {
        self.popularMovies = popularMovies
        self.movieDBService = movieDBService
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
            viewState = .error(error)
        }
    }

    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        let url_poster_image = "https://image.tmdb.org/t/p/w500\(posterPath)"
        return url_poster_image
    }}
