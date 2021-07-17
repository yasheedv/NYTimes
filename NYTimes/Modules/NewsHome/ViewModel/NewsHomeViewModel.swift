//
//  NewsHomeViewModel.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

typealias UIUpdateHandler = () -> Void
typealias ErrorHandler = (_ error: String) -> Void
class NewsHomeViewModel {
    var uiUpdateHandler: UIUpdateHandler?
    var errorHandler: ErrorHandler?
    var news: [NewsModel] = [] {
        didSet {
            uiUpdateHandler?()
        }
    }
    var selectedNews: NewsModel!
    /// Service call
    func getNews() {
        let serviceCalls = NetworkCalls()
        serviceCalls.getNews { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let newsRoot):
                self.news = newsRoot.results
            case .failure(let error):
                self.errorHandler?(error.stringValue)
            }
        }
    }
    /// Provide model to update table cell
    func newsFor(_ indexPath: IndexPath) -> NewsModel {
        news[indexPath.row]
    }
    /// keeps the selected news model
    func newsSelected(_ indexPath: IndexPath) {
        selectedNews = news[indexPath.row]
    }
    /// creating NewsDetailsViewModel
    func newsDetailsViewModel() -> NewsDetailsViewModel {
        NewsDetailsViewModel(news: selectedNews)
    }
}
