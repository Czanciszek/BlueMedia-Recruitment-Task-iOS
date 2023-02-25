//
//  MainAPIContainer.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

struct MainAPIContainer:
    SearchEngineAPIContainer {
        
    let searchEngineAPI: SearchEngineAPI
        
    init(searchEngineAPI: SearchEngineAPI) {
        self.searchEngineAPI = searchEngineAPI
    }

    static func instantiate() -> MainAPIContainer {
        let networkDispatcher = NetworkDispatcher()

        return MainAPIContainer(
            searchEngineAPI: ConcreteSearchEngineAPI(networkDispatcher: networkDispatcher)
        )
    }
}
