//
//  NYTimesTests.swift
//  NYTimesTests
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import XCTest
@testable import NYTimes

class NYTimesTests: XCTestCase {
    
    func testNetworkCall() {
        let calls = NetworkCalls()
        var newsResponse: [NewsModel]?
        let newsExpectation = expectation(description: "news")
        calls.getNews { result in
            switch result {
            case .success(let root):
                newsResponse = root.results
                newsExpectation.fulfill()
            case .failure(_):
                newsExpectation.fulfill()
            }
        }
        waitForExpectations(timeout: 4) { _ in
            XCTAssertNotNil(newsResponse)
        }
    }
    func testNetworkCallWithWrongKey() {
        var param = NewsRequestParam()
        param.apiKey = ""
        let engine = NetworkEngine()
        var rootModel: NewsRootModel?
        let expectation = expectation(description: "newsRoot")
        engine.dataTask(urlBuildable: param,
                        responseModel: NewsRootModel.self) { result in
            switch result {
            case .success(let root):
                rootModel = root
                expectation.fulfill()
            case .failure(_):
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 4) { _ in
            XCTAssertNil(rootModel, "The rootModel should be nil")
        }
    }
    func testDateFormat() {
        let expectedFormat = "17 Jul 2021"
        let fromDate = "2021/07/17"
        let formatedDate = fromDate.formatedDate()
        XCTAssertEqual(formatedDate, expectedFormat)
    }
    func testDifferentDateFormat() {
        let expectedFormat = "17 Jul 2021"
        let fromDate = "17/07/2021"
        let formatedDate = fromDate.formatedDate()
        XCTAssertNotEqual(formatedDate, expectedFormat)
    }
    func testNewsDetailsViewModel() {
        let metaData = MediaMetaData(url: "url")
        let media = Media(metaData: [metaData])
        let news = NewsModel(articleUrl: "",
                             title: "title",
                             abstract: "abstract",
                             publishedDate: "2021/07/17",
                             byLine: "byLine",
                             media: [media])
        let viewModel = NewsDetailsViewModel(news: news)
        XCTAssertEqual(viewModel.auther(), "\(news.byLine) / \(news.publishedDate.formatedDate())")
        XCTAssertEqual(viewModel.content(), news.abstract)
        XCTAssertEqual(viewModel.title(), news.title)
        XCTAssertEqual(viewModel.imageURL(), "url")
    }
    func testRequestParam() {
        let newsParam = NewsRequestParam()
        XCTAssertEqual(newsParam.acceptType, ContentType.json)
        XCTAssertEqual(newsParam.httpMethod, HTTPMethod.get)
        XCTAssertNil(newsParam.parameters)
        XCTAssertNotNil(newsParam.path, "Path is mandatory")
    }
}
