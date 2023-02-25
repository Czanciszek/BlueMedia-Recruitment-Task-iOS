//
//  SearchEngineRequest.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import Foundation

final class SearchEngineRequest: APIRequest {

    let searchQuery: String
    let countPerPage: Int
    let page: Int
    let mode: Int

    init(
        searchQuery: String,
        countPerPage: Int = 10,
        page: Int = 1,
        mode: Int = 1) {
        self.searchQuery = searchQuery
        self.countPerPage = countPerPage
        self.page = page
        self.mode = mode
    }

    var queryItems: [URLQueryItem]? {
        return [
            URLQueryItem(name: "query", value: searchQuery),
            URLQueryItem(name: "per-page", value: "\(countPerPage)"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "mode", value: "\(mode)")
        ]
    }

    var path: String? {
        return "/search-engine/search"
    }
}
