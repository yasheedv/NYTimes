//
//  NetworkCalls.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

class NetworkCalls {
    func getNews(completion: @escaping ResponseHandler<NewsRootModel>) {
        let requestParam = NewsRequestParam()
        let engine = NetworkEngine()
        engine.dataTask(urlBuildable: requestParam,
                        responseModel: NewsRootModel.self,
                        completion: completion)
    }
}
