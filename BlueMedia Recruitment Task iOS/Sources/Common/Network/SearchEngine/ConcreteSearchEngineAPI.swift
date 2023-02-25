//
//  ConcreteSearchEngineAPI.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import Foundation
import RxSwift

final class ConcreteSearchEngineAPI: SearchEngineAPI {
    
    private let networkDispatcher: NetworkDispatcher
    
    init(networkDispatcher: NetworkDispatcher) {
        self.networkDispatcher = networkDispatcher
    }

    func search(key: String) -> Observable<SearchEngineResponse> {

        let baseURLString = APIBaseURLRequest.blueMediaHelp.urlString
        let request = SearchEngineRequest(searchQuery: key)

        return networkDispatcher.dispatch(baseURLString: baseURLString, request: request)
    }
    
}
