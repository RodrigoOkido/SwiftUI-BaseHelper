//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

class APIViewModel {
    
    // MARK: - Dependencies
    @Injected var movieDBService: MovieDBRepositoryProtocol

    // MARK: - Property Wrappers
    @Published var popularMovies: [Movie]

    // MARK: - Initializer
    init(popularMovies: [Movie] = []) {
        self.popularMovies = popularMovies
    }

    
    // MARK: - API Request
    func requestPopularMovies() async throws -> [Movie] {

        let response = await movieDBService.getMovies()

        switch response {
        case .success(let data):
            popularMovies = data
            return self.popularMovies
        case .failure(let error):
            print(error)
            return []
        }
    }

    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        let url_poster_image = "https://image.tmdb.org/t/p/w500\(posterPath)"
        return url_poster_image
    }}
