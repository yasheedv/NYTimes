//
//  NewsRequestParam.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

struct NewsRequestParam {
    var apiKey = "9xTq3An4b3UkX8Ykxx5tmTxYZCOiIJVV"
    let apiPeriods  = 30
    let apiSections = "all-sections"
}
extension NewsRequestParam: URLBuildable {
    var path: String? {
        "svc/mostpopular/v2/mostviewed/\(apiSections)/\(apiPeriods).json?api-key=\(apiKey)"
    }
}
