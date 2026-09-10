//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import SwiftUI

@Observable
class APIViewModel: BaseViewModel {
    
    // MARK: - Private Properties
    private var movieDBService: MovieDBRepositoryProtocol
    
    // MARK: - Public Properties
    var popularMovies: [Movie]
    
    // MARK: - Initializer
    init(popularMovies: [Movie] = [],
         movieDBService: MovieDBRepositoryProtocol? = nil) {
        @Injected var injectedMovieDBService: MovieDBRepositoryProtocol

        self.popularMovies = popularMovies
        self.movieDBService = movieDBService ?? injectedMovieDBService
    }
}

// MARK: - Public Methods
extension APIViewModel {
    
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
}
