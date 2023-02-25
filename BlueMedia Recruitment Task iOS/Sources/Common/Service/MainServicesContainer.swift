//
//  MainServicesContainer.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

struct MainServicesContainer:
    SearchServiceContainer {
    
    let searchService: SearchService
    
    init(searchService: SearchService) {
        self.searchService = searchService
    }
    
    static func instantiate() -> MainServicesContainer {
        
        let apiContainer = MainAPIContainer.instantiate()
        
        return MainServicesContainer(
            searchService: ConcreteSearchService(dependencies: apiContainer)
        )
    }
}
