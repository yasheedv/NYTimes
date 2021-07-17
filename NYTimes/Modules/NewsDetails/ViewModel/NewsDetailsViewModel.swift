//
//  NewsDetailsViewModel.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

class NewsDetailsViewModel {
    var news: NewsModel
    init(news: NewsModel) {
        self.news = news
    }
    func imageURL() -> String? {
        guard let firstMedia = news.media.first,
              let metaData = firstMedia.metaData.last  else {
            return nil
        }
        return metaData.url
    }
    func auther() -> String {
        "\(news.byLine) / \(news.publishedDate.formatedDate())"
    }
    func title() -> String {
        news.title
    }
    func content() -> String {
        news.abstract
    }
}
