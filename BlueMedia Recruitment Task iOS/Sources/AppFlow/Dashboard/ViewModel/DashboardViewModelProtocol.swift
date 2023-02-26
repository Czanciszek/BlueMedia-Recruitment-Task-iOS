//
//  DashboardViewModelProtocol.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import Combine

protocol DashboardViewModelProtocol: AnyObject {

    var searchResults: AnyPublisher<[SearchResult], Never> { get }

    func searchEngine(text: String)
}
