//
//  APIView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct APIView: View {
    
    // MARK: - Environments
    @Environment(\.colorScheme) var colorScheme

    // MARK: - ViewModel
    @ObservedObject private var viewModel: APIViewModel

    init(viewModel: APIViewModel = APIViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.popularMovies, id: \.id) { movie in
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
                            .frame(width: WidthSize.xxl,
                                   height: HeightSize.huge)
                            .cornerRadius(CornerRadius.sm)
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                    .bold()
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text(movie.overview)
                                    .font(.body)
                                    .frame(height: HeightSize.huge)
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                                Text("Average Score: \(String(format: "%.2f", movie.vote_average))")
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
                try await viewModel.requestPopularMovies()
            }
        }
        .alert(isPresented: $viewModel.requestFailed,
               content: { () -> Alert in
                    Alert(title: Text("Error"),
                          message: Text(viewModel.requestFailedMessage),
                          dismissButton: .default(Text("Ok")))
                })
    }
}

#Preview {
    APIView()
}
