//
//  SearchEngineAPI.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import Combine

protocol SearchEngineAPI {

    func search(key: String) -> AnyPublisher<SearchEngineResponse, Error>

}

protocol SearchEngineAPIContainer {

    var searchEngineAPI: SearchEngineAPI { get }
}

