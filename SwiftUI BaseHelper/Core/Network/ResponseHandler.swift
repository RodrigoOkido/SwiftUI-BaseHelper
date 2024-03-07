//
//  ResponseHandler.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

struct ResponseHandler {

    static func handle<T>(
        mapper: some ModelMapper,
        response: RequestResponse<some Codable, NetworkRequestError>) -> Result<T,RequestError>
     {
        switch response {
        case .success(let items):
            do {
                let domainItems: T = try type(of: mapper).map(items)
                return .success(domainItems)
            } catch {
                return .failure(RequestError(errorType: .couldNotMap,
                                                 errorMessage: "Could not map"))
            }
        case .failure(let error):
            return .failure(RequestErrorMapper.map(error))
        case .customError(let error):
            return .failure(RequestErrorMapper.map(error))
        }
    }
}

public final class RequestErrorMapper {

    public static func map(_ input: NetworkRequestError) -> RequestError {
        
        if input.isTokenError == true {
            return RequestError(errorType: .tokenError, 
                                errorMessage: input.error)
        }

        guard let statusCode = input.statusCode else {
            return RequestError(errorType: .undefined, 
                                errorMessage: input.error)
        }
        
        switch statusCode {
        case 500...599:
            return RequestError(errorType: .serverError, 
                                errorMessage: input.error)
        case 400:
            return RequestError(errorType: .invalidRequest, 
                                errorMessage: input.error)
        case 401:
            return RequestError(errorType: .notAllowed, 
                                errorMessage: input.error)
        case 404:
            return RequestError(errorType: .notFound, 
                                errorMessage: input.error)
        case 408:
            return RequestError(errorType: .timeout, 
                                errorMessage: input.error)
        case 409:
            return RequestError(errorType: .conflict, 
                                errorMessage: input.error)
        default:
            return RequestError(errorType: .undefined, 
                                errorMessage: input.error)
        }
    }
}

