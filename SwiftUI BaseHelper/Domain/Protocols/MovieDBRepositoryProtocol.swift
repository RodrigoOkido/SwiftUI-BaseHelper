import Foundation

protocol MovieDBRepositoryProtocol {

    func getMovies() async -> Result<[Movie], RequestError>
}
