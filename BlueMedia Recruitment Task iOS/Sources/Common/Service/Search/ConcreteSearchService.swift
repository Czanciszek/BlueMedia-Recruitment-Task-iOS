//
//  ConcreteSearchService.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import Combine

final class ConcreteSearchService: SearchService {
    
    typealias Dependencies = SearchEngineAPIContainer

    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func search(searchKey: String) -> AnyPublisher<[SearchResult], Error> {

        dependencies.searchEngineAPI
            .search(key: searchKey)
            .map { $0.asSearchResults() }
            .eraseToAnyPublisher()
    }
}
