//
//  SearchEngineAPI.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import RxSwift

protocol SearchEngineAPI {

    func search(
        key: String)
        -> Observable<SearchEngineResponse>

}

protocol SearchEngineAPIContainer {

    var searchEngineAPI: SearchEngineAPI { get }
}

