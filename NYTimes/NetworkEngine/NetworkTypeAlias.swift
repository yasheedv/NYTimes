//
//  NetworkTypeAlias.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

/// typealias used for NetworkEngine
typealias Parameters = [String: Any]
typealias ResponseHandler<T: Decodable> = (Swift.Result<T, NetworkError>) -> Void
