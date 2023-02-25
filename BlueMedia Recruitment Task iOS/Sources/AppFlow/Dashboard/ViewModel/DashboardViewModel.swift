//
//  DashboardViewModel.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import Combine
import Foundation

final class DashboardViewModel {
    weak var coordinator : DashboardCoordinator?
    
    typealias Dependencies = SearchServiceContainer
    
    @Published private var searchResultsPublisher: [SearchResult] = []

    private let dependencies: Dependencies
    
    private var errorSubject: PassthroughSubject<Error, Never> = .init()
    private var cancellables: Set<AnyCancellable> = []
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
        bindError()
    }
}

extension DashboardViewModel: DashboardViewModelProtocol {

    var searchResults: AnyPublisher<[SearchResult], Never> {
        return $searchResultsPublisher
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    func searchEngine(text: String) {

        dependencies.searchService
            .search(searchKey: text)
            .catch {
                [unowned self] error in
                errorSubject.send(error)
                return Just(searchResultsPublisher)
            }
            .sink {
                [weak self] searchResults in
                self?.searchResultsPublisher = searchResults
            }
            .store(in: &cancellables)
    }
    
}

private extension DashboardViewModel {
    
    func bindError() {
        errorSubject
            .receive(on: DispatchQueue.main)
            .sink {
                [weak self] error in
                self?.coordinator?.presentError(error: error)
            }
            .store(in: &cancellables)
    }
}
