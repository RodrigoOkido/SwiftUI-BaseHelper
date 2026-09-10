//
//  MovieDBInterceptor.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 08/03/24.
//

import Foundation
import CoreNetworkLayer

struct MovieDBInterceptor: RequestInterceptor {

    // MARK: - Private Properties
    private let apiKey: String
    private let queryBuilder = QueryBuilder()

    // MARK: - Initializer
    init(apiKey: String) {
        self.apiKey = apiKey
    }

    func adapt(request: URLRequest) -> URLRequest {
        return addQuery(to: request)
    }
}

// MARK: - Private Methods
extension MovieDBInterceptor {

    private func addQuery(to urlRequest: URLRequest) -> URLRequest {

        // If contains private key and public key
//        let timeStamp = String(Date().timeIntervalSince1970)
//        let parameter = MarvelDefaultParameters(apikey: publicKey,
//                                                hash: md5(from: timeStamp + self.privateKey + self.publicKey),
//                                                timeStamp: timeStamp)

        guard let url = urlRequest.url,
              var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return urlRequest
        }

        var urlRequest = urlRequest

        let queryItems = queryBuilder.build(parameters: ["api_key": apiKey])

        // Coalesce rather than optional-chaining `append`: on a request with no existing
        // query items (any non-GET verb) `queryItems` is nil, and appending through the
        // optional would silently drop the API key.
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems

        urlRequest.url = urlComponents.url

        return urlRequest
    }

//    private func md5(from string: String) -> String {
//        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())
//        return digest.map { String(format: "%02hhx", $0) }.joined()
//    }
}
