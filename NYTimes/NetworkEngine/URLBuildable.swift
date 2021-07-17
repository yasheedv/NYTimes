//
//  URLBuildable.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

/**
 Any class or struct confirmed to URLBuildable can create an URLRequest
 */
protocol URLBuildable {
    /// HTTPMethod default is get
    var httpMethod: HTTPMethod {get}
    ///API path for the request. Default is nil
    var path: String? {get}
    ///Parameters is request body and its a typealias of [String: Any]
    var parameters: Parameters? {get}
    ///Accept type in header. Default is json
    var acceptType: ContentType {get}
}
// MARK: - URLRequest Generation
extension URLBuildable {
    var httpMethod: HTTPMethod {
        .get
    }
    var parameters: Parameters? {
        nil
    }
    var acceptType: ContentType {
        .json
    }
    var path: String? {
        nil
    }
    /// Creates an URLRequest with the provided data
    func asURLRequest() -> URLRequest {
        var urlCopy = buildEnvironment.baseURL
        if let pathCopy = path {
            urlCopy += pathCopy
        }
        guard let url = URL(string: urlCopy) else {
            fatalError("Invalid URL. Check the given URL")
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.addValue(acceptType.rawValue,
                            forHTTPHeaderField: HTTPHeader.acceptType.rawValue)
        urlRequest.addValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeader.contentType.rawValue)
        if let params = parameters {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        }
        return urlRequest
    }
}
