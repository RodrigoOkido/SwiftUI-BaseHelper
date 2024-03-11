//
//  APIViewModel.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 12/10/22.
//

import Foundation
import UIKit

class APIViewModel {
    
    // MARK: - Property Wrappers
    @Injected var movieDBService: MovieDBRepositoryProtocol
    @Published var popularMovies: [Movie] = []

    // MARK: - Private Functions
    private func getKeyValue(forKey key: String) -> String? {
        return Bundle.main.infoDictionary?[key] as? String
    }

    // MARK: - Public Functions
    func getMoviePosterURL(posterPath: String?) -> String {
        guard let posterPath else { return "" }
        guard let configMoviePosterImage = getKeyValue(forKey: "API_URL_POSTER_IMAGE") else { return "" }
        let url_poster_image = "https://\(configMoviePosterImage)\(posterPath)"
        return url_poster_image
    }
    
    // MARK: - API Request
    func requestPopularMovies() async throws -> [Movie] {
//        guard let configURL = getKeyValue(forKey: "API_URL") else { return [] }
//        guard let url = URL(string: "https://\(configURL)") else { return [] }
//       
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
//            popularMovies = decodedResponse.results
//            return popularMovies
//        } catch {
//            print("Invalid Data")
//            return []
//        }
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
}
