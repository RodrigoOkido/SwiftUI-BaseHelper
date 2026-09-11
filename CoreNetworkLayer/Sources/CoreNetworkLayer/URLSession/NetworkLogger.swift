//
//  NetworkLogger.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 07/03/24.
//

import Foundation

enum NetworkLogType {
    case onlyRequest
    case onlyHeaders
    case onlyBody
    case onlyResponse
    case complete
}

struct NetworkLogger {

    static func log(response: RestResponse, 
                    logType: NetworkLogType) {

        print("==============================================")

        switch logType {

        case .onlyRequest:
            log(request: response.request)
        case .onlyHeaders:
            log(headers: response.request?.allHTTPHeaderFields)
            log(headers: response.headers)
        case .onlyBody:
            log(body: response.request?.httpBody)
        case .onlyResponse:
            log(httpResponse: response)
        case .complete:
            log(request: response.request)
            log(headers: response.request?.allHTTPHeaderFields)
            log(body: response.request?.httpBody)
            log(httpResponse: response)
            log(headers: response.headers)
            log(body: response.dataResponse.data)
        }
        print("------------------------------")
    }

    static func log(request: URLRequest?) {
        print("⚪️ REQUEST: " + redactedURL(from: request), "\n")
    }

    /// Query values are masked before logging: the logger cannot tell an `api_key` from a `page`,
    /// and console output routinely ends up in screenshots and bug reports.
    static func redactedURL(from request: URLRequest?) -> String {
        guard let url = request?.url,
              var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return request?.url?.absoluteString ?? "-"
        }

        components.queryItems = components.queryItems?.map {
            URLQueryItem(name: $0.name, value: "•••")
        }

        return components.url?.absoluteString ?? "-"
    }

    static func log(httpResponse: RestResponse) {
        var icon = "🟢"
        if httpResponse.statusCode >= 400 {
            icon = "🔴"
        } else if httpResponse.statusCode >= 300 {
            icon = "🟡"
        }
        print(icon + " RESPONSE: \(httpResponse.statusCode)", "\n")
    }

    static func log(headers: [AnyHashable: Any]?) {
        var description = "nil"
        if let headers = headers {
            description = descriptionFrom(dictionary: headers)
        }
        print("> Headers:")
        print(description, "\n")
    }

    static func log(body: Data?) {
        var description = "nil"
        if let body = body {
            if let dictionary = try? JSONSerialization.jsonObject(
                with: body,
                options: .mutableLeaves
            ) as? [String: Any] {
                description = descriptionFrom(dictionary: dictionary)
            } else if let stringDescription = String(data: body, encoding: .utf8) {
                description = stringDescription
            }
        }
        print("> Body:")
        print(description, "\n")
    }

    static func descriptionFrom(dictionary: [AnyHashable: Any]) -> String {
        var description = "[\n"
        for (key, value) in dictionary {
            description += "    \"" + String(describing: key) + "\": \"" + String(describing: value) + "\",\n"
        }
        description = String(String(description.dropLast()).dropLast()) + "\n]"
        return description
    }

    static func log(error: DecodingError?) {
        guard let error = error else {
            return
        }

        print("🔴 Failed to decode")
        print(error.localizedDescription, "\n")
    }
}
