import Foundation

enum MovieDBEndpoint: Endpoint {

    case getMovies

    var path: String {
        switch self {
        case .getMovies:
            return "/3/movie/popular"
        }
    }
}
