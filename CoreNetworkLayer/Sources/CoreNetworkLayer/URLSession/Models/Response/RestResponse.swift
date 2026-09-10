import Foundation

struct RestResponse {

    // MARK: - Private Properties
    private let jsonCoder: JSONCoder

    // MARK: - Properties
    public let request: URLRequest?
    public let dataResponse: (data: Data, urlResponse: URLResponse)

    // MARK: - Computed Properties
    var isRequestSucceeded: Bool {
        statusCode >= 200 && statusCode < 300
    }

    var defaultError: Error {
        return RequestError(errorType: .undefined,
                            errorMessage: "Error to process the request")
    }

    // MARK: - Initialization
    public init(request: URLRequest?,
                dataResponse: (data: Data, urlResponse: URLResponse),
                jsonCoder: JSONCoder) {
        self.request = request
        self.dataResponse = dataResponse
        self.jsonCoder = jsonCoder
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

        if isRequestSucceeded {
            return Result.success("")
        } else {
            return Result.failure(getRequestError(errorType: errorType))
        }
    }

    public func result<T: Codable,
                       E: Codable & Error>(modelType: T.Type, errorType: E.Type) -> Result<Codable, Error> {

        if isRequestSucceeded {
            do {
                let model = try jsonCoder.decode(modelType, from: dataResponse.data)
                return Result.success(model)
            } catch let error {
#if DEBUG
                NetworkLogger.log(error: error as? DecodingError)
#endif
                return Result.failure(error)
            }
        } else {
            return Result.failure(getRequestError(errorType: errorType))
        }
    }

    private func getRequestError<E: Codable & Error>(errorType: E.Type) -> Error {
        if let error = try? jsonCoder.decode(errorType, from: dataResponse.data) {
            return error
        } else {
            return defaultError
        }
    }
}
