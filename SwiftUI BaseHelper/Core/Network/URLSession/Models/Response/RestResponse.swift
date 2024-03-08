import Foundation
import UIKit

struct RestResponse {

    // MARK: - Dependencies
    @Injected var decoder: JSONDecoder

    // MARK: - Properties
    public let request: URLRequest?
    public let dataResponse: (data: Data, urlResponse: URLResponse)

    // MARK: - Computed Properties
    var isSuccessful: Bool {
        statusCode >= 200 && statusCode < 300
    }

    var defaultError: Error {
        return RequestError(errorType: .undefined,
                            errorMessage: "network.error.default".localized)
    }

    // MARK: - Initialization
    public init(request: URLRequest?,
                dataResponse: (data: Data, urlResponse: URLResponse)) {
        self.request = request
        self.dataResponse = dataResponse
    }
}

// MARK: - Response Properties
extension RestResponse {

    public var statusCode: Int {
        guard let httpResponse = dataResponse.urlResponse as? HTTPURLResponse else { return -1 }
        return httpResponse.statusCode
    }

    public var headers: [AnyHashable: Any]? {
        guard let httpResponse = dataResponse.urlResponse as? HTTPURLResponse else { return nil }
        return httpResponse.allHeaderFields
    }
}

// MARK: - Response Data Conversion
extension RestResponse {

    public func result<E: Codable & Error>(errorType: E.Type) -> Result<String, Error> {

        if isSuccessful {
            return Result.success("")
        } else {
            return Result.failure(getRequestError(errorType: errorType))
        }
    }

    public func result<T: Codable,
                       E: Codable & Error>(modelType: T.Type, errorType: E.Type) -> Result<Codable, Error> {

        if isSuccessful {
            return successResult(modelType: modelType)
        } else {
            return Result.failure(getRequestError(errorType: errorType))
        }
    }

    private func successResult<T: Codable>(modelType: T.Type) -> Result<Codable, Error> {

        do {
            let model = try decoder.decode(modelType, from: dataResponse.data)
            return Result.success(model)
        } catch let error {
#if DEBUG
            NetworkLogger.log(error: error as? DecodingError)
#endif
            return Result.failure(RequestError(errorType: .undefined,
                                               errorMessage: "network.error.default".localized))
        }
    }

    private func getRequestError<E: Codable & Error>(errorType: E.Type) -> Error {
        if let error = try? decoder.decode(errorType, from: dataResponse.data) {
            return error
        } else {
            return defaultError
        }
    }
}
