import Foundation

protocol CoreNetworkProtocol: AnyObject {

    // MARK: - Request with Parameters
    func request<T: Decodable,
                 Parameters: Encodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               interceptors: [RequestInterceptor],
                               parameters: Parameters,
                               responseType: T.Type,
                               errorType: E.Type) async -> RequestResponse<T, E>

    func request<Parameters: Encodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               interceptors: [RequestInterceptor],
                               parameters: Parameters,
                               errorType: E.Type) async -> RequestEmptyResponse<E>

    // MARK: - Request without Parameters
    func request<T: Decodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               interceptors: [RequestInterceptor],
                               responseType: T.Type,
                               errorType: E.Type) async -> RequestResponse<T, E>

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               interceptors: [RequestInterceptor],
                               errorType: E.Type) async -> RequestEmptyResponse<E>
}
