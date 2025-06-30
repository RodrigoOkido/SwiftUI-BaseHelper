//
//  APIMovieDetailView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Yukio Okido on 14/10/22.
//

import SwiftUI
import DesignSystem

struct APIMovieDetailView: View {
    
    // MARK: - ViewModel
    @State var viewModel: APIDetailMovieViewModel

    // MARK: - Initializer
    init(viewModel: APIDetailMovieViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: viewModel.getMoviePosterURL(posterPath: viewModel.movie.poster_path))) { image in
                    image.resizable()
                } placeholder: {
                    Text(viewModel.movie.title)
                }
                .frame(width: WidthSize.giant, 
                       height: HeightSize.titan,
                       alignment: .center)
                .cornerRadius(CornerRadius.sm)
                VStack(alignment: .leading) {
                    Text(viewModel.movie.title)
                        .font(.title2)
                        .bold()
                    Text(viewModel.movie.overview)
                        .padding()
                    HStack {
                        Text("Vote average:")
                            .bold()
                        Text(String(format: "%.2f", viewModel.movie.vote_average))
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}
