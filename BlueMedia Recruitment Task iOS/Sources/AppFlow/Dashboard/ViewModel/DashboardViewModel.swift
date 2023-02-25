//
//  DashboardViewModel.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import RxCocoa
import RxSwift

final class DashboardViewModel {
    weak var coordinator : DashboardCoordinator?
    
    typealias Dependencies = SearchServiceContainer
    
    private let searchResultsRelay = PublishRelay<[SearchResult]>()
    private let errorSubject = PublishSubject<Error>()
    private let disposeBag = DisposeBag()
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
        bindError()
    }
}

extension DashboardViewModel: DashboardViewModelProtocol {

    var searchResults: Driver<[SearchResult]> {
        return searchResultsRelay.asDriver(onErrorDriveWith: .never())
    }

    func searchEngine(text: String) {

        dependencies.searchService
            .search(searchKey: text)
            .subscribe(onNext: {
                [weak self] result in
                self?.searchResultsRelay.accept(result)
            }, onError: {
                [weak self] error in
                self?.errorSubject.on(.next(error))
            })
            .disposed(by: disposeBag)
    }
    
}

private extension DashboardViewModel {
    
    var errorDriver: Driver<Error> {
        errorSubject.asDriver(onErrorDriveWith: .never())
    }
    
    func bindError() {
        errorDriver
            .drive(onNext: {
                [weak self] error in
                self?.coordinator?.presentError(error: error)
            })
            .disposed(by: disposeBag)
    }
}
