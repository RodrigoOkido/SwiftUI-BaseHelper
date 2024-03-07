import Foundation

public class MovieDBRepository: MovieDBRepositoryProtocol {

    // MARK: - Dependencies
    @Injected var network: CoreNetworkProtocol

    func getMovies() async -> Result<[RemoteMovie], RequestError> {

        let parameters = CoreNetworkCodableParameters(
            endpoint: MovieDBEndpoint.getMovies,
            method: .get,
            parameters: nil,
            interceptors: [JSONInterceptor()],
            responseType: [RemoteMovie].self,
            errorType: NetworkRequestError.self
        )
        
        let requestResponse = await network.request(parameters)
        return ResponseHandler.handle(mapper: MovieMapper(), response: requestResponse)
    }
}
