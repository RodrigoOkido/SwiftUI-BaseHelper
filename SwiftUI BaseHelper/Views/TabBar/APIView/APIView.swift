//
//  APIView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI

struct APIView: View {
    
    @Environment(\.colorScheme) var colorScheme

    // MARK: - ViewModel
    private var viewModel: APIViewModel = APIViewModel()
    
    // MARK: - Property Wrappers
    @State private var popularMovies: [Movie] = []
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(popularMovies, id: \.id) { movie in
                    NavigationLink {
                        APIMovieDetailView(movie: movie)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: viewModel.getMoviePosterURL(posterPath: movie.poster_path))) { image in
                                image.resizable()
                            } placeholder: {
                                VStack {
                                    Text(movie.title)
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }
                            }
                            .frame(width: 100, height: 160)
                            .cornerRadius(10)
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text(movie.overview)
                                    .font(.body)
                                    .frame(height: 140)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Average Score: \(String(format: "%.2f",movie.vote_average))")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                    }
                    Divider()
                }
            }
            .padding()
        }
        .navigationTitle("Popular Movies")
        .navigationBarTitleDisplayMode(.large)
        .onAppear{
            Task {
                popularMovies = try await viewModel.requestPopularMovies()
            }
        }
    }
}

struct APIView_Previews: PreviewProvider {
    static var previews: some View {
        APIView()
    }
}
