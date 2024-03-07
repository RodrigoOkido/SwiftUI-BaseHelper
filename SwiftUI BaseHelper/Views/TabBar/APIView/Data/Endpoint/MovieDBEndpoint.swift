import Foundation

enum MovieDBEndpoint: Endpoint {

    case getMovies

    var path: String {
        switch self {
        case .getMovies:
            return "/v1/public/characters"
        }
    }
}
