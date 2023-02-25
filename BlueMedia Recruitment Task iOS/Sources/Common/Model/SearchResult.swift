//
//  SearchResult.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

struct SearchResult {
    let id: Int
    let title: String
    let text: String
    let urlLink: String
}

extension SearchResult: Equatable, Hashable { }

extension SearchEngineResponse {

    func asSearchResults() -> [SearchResult] {

        let baseURLString = APIBaseURLRequest.blueMediaHelp.urlString

        return items.map {
            result in

            return SearchResult(
                id: result.id,
                title: result.title,
                text: result.text,
                urlLink: baseURLString + result.link)
        }
    }
}
