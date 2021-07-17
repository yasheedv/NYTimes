//
//  NetworkConstants.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

/// Constanst used for NetworkCall

enum ContentType: String {
    case json = "application/json"
}

enum HTTPHeader: String {
    case acceptType
    case contentType = "Content-Type"
}

enum HTTPMethod: String {
    case post, get
}

enum NetworkError: Error, Equatable {
    case  emptyResponse
    case customError(error: String)
    var stringValue: String {
        switch self {
        case .customError(let error):
            return error
        default:
            return self.localizedDescription
        }
    }
}
