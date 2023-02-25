//
//  SearchService.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import Combine

protocol SearchService {

    func search(searchKey: String) -> AnyPublisher<[SearchResult], Error>
}

protocol SearchServiceContainer {
    
    var searchService: SearchService { get }
}
