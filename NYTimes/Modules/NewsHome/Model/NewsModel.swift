//
//  NewsModel.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

struct NewsRootModel: Codable {
    let results: [NewsModel]
}
struct NewsModel: Codable {
    var articleUrl: String
    var title: String
    var abstract: String
    var publishedDate: String
    var byLine: String
    var media: [Media]
    private enum CodingKeys: String, CodingKey {
        case articleUrl = "url"
        case publishedDate = "published_date"
        case byLine = "byline"
        case title, abstract, media
    }
}
struct Media: Codable {
    var metaData: [MediaMetaData]
    private enum CodingKeys: String, CodingKey {
        case metaData = "media-metadata"
    }
}
struct MediaMetaData: Codable {
    var url: String
}
