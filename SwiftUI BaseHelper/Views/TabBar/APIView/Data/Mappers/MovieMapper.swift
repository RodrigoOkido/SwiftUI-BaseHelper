import Foundation

public struct MovieMapper: ModelMapper {
    public typealias T = RemoteMovie

    public static func map<T>(_ input: some Codable) throws -> T {
        guard let input: RemoteMovie = input as? RemoteMovie else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }

        let movie = Movie(poster_path: input.poster_path,
                          overview: input.overview,
                          genre_ids: input.genre_ids,
                          id: input.id,
                          title: input.title,
                          vote_average: input.vote_average)

        guard let result: T = movie as? T else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }
        return result
    }
}

public struct MoviesMapper: ModelMapper {
    public typealias T = [RemoteMovie]

    public static func map<T>(_ input: some Codable) throws -> T {
        guard let input: [RemoteMovie] = input as? [RemoteMovie] else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }

        let items: [RemoteMovie] = try input.map {
            return try MovieMapper.map($0)
        }
        guard let result = items as? T else {
            throw RequestError(errorType: .couldNotMap, 
                               errorMessage: "Could not map")
        }
        return result
    }
}
 
