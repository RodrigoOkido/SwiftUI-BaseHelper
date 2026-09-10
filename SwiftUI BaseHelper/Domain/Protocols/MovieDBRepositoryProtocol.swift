import Foundation
import CoreNetworkLayer

protocol MovieDBRepositoryProtocol {

    func getMovies() async -> Result<[Movie], RequestError>
}
