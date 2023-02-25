//
//  SearchService.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import RxSwift

protocol SearchService {

    func search(searchKey: String) -> Observable<[SearchResult]>
}

protocol SearchServiceContainer {
    
    var searchService: SearchService { get }
}
