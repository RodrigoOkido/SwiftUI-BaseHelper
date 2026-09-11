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
    @ObservationIgnored
    private let injectedMovieDBService: MovieDBRepositoryProtocol?
    
    // MARK: - Public Properties
    var popularMovies: [Movie]
    
    // MARK: - Computed Properties
    private var movieDBService: MovieDBRepositoryProtocol {
        if let injectedMovieDBService {
            return injectedMovieDBService
        }
        @Injected var resolvedMovieDBService: MovieDBRepositoryProtocol
        return resolvedMovieDBService
    }
    
    // MARK: - Initializer
    init(popularMovies: [Movie] = [],
         movieDBService: MovieDBRepositoryProtocol? = nil) {
        self.popularMovies = popularMovies
        self.injectedMovieDBService = movieDBService
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
