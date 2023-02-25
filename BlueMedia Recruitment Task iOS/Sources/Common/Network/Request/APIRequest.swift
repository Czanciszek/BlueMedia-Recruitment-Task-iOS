//
//  APIRequest.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import Foundation

protocol APIRequest {
    var queryItems: [URLQueryItem]? { get }
    var path: String? { get }
    var requestMethod: APIRequestMethod { get }
}

extension APIRequest {
    var queryItems: [URLQueryItem]? {
        return nil
    }

    var path: String? {
        return nil
    }

    var requestMethod: APIRequestMethod {
        return .get
    }
}
