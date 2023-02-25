//
//  SearchEngineResponse.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

struct SearchEngineResponse: Codable {

    struct SearchItem: Codable {
        let id: Int
        let title: String
        let text: String
        let link: String
    }

    let items: [SearchItem]
}
