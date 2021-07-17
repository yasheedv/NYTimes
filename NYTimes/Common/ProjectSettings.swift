//
//  ProjectSettings.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

let buildEnvironment: BuidlEnvironment = .prod
enum BuidlEnvironment {
    case prod
    var baseURL: String {
        switch self {
        case .prod:
            return "http://api.nytimes.com/"
        }
    }
}
