//
//  APIMovieDetailView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 14/10/22.
//

import SwiftUI

struct APIMovieDetailView: View {
    
    // MARK: - ViewModel
    var viewModel: APIDetailMovieViewModel = APIDetailMovieViewModel()
    
    // MARK: - Stored properties
    var movie: Movie
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.getMoviePosterURL(posterPath: movie.poster_path))) { image in
                    image.resizable()
                } placeholder: {
                    Text(movie.title)
                }
                .frame(width: 280, height: 360, alignment: .center)
                .cornerRadius(10)
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.title2)
                        .bold()
                    Text(movie.overview)
                        .padding()
                    HStack {
                        Text("Vote average:")
                            .bold()
                        Text(String(format: "%.2f", movie.vote_average))
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}
