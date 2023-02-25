//
//  ConcreteSearchService.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import RxSwift

final class ConcreteSearchService: SearchService {
    
    typealias Dependencies = SearchEngineAPIContainer

    private let dependencies: Dependencies
    private let disposeBag = DisposeBag()
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func search(searchKey: String) -> Observable<[SearchResult]> {

        dependencies.searchEngineAPI
            .search(key: searchKey)
            .flatMap({
                Observable.just($0.asSearchResults())
            })
    }
}
