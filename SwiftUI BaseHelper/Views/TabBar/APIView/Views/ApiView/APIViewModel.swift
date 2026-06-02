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
}
