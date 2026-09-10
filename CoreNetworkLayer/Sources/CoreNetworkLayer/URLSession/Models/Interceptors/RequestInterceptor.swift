import Foundation

public protocol RequestInterceptor {

    func adapt(request: URLRequest) async -> URLRequest
}
