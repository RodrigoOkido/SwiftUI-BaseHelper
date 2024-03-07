import Foundation

protocol MovieDBRepositoryProtocol {

    func getMovies() async -> Result<[RemoteMovie], RequestError>
}
