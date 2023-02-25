//
//  DashboardViewModelProtocol.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import RxCocoa

protocol DashboardViewModelProtocol: AnyObject {

    var searchResults: Driver<[SearchResult]> { get }

    func searchEngine(text: String)
}
