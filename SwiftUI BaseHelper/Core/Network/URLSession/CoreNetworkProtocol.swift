import Foundation

protocol CoreNetworkProtocol: AnyObject {

    func request<T: Decodable,
                 Parameters: Encodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               parameters: Parameters,
                               responseType: T.Type,
                               errorType: E.Type) async -> RequestResponse<T, E>

    func request<T: Decodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               responseType: T.Type,
                               errorType: E.Type) async -> RequestResponse<T, E>

    func request<E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               errorType: E.Type) async -> RequestEmptyResponse<E>

    func request<Parameters: Encodable,
                 E: Decodable>(endpoint: Endpoint,
                               method: HTTPVerb,
                               parameters: Parameters,
                               errorType: E.Type) async -> RequestEmptyResponse<E>
}
