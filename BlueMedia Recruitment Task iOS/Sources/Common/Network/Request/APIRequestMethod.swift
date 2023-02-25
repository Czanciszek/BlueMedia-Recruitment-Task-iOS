//
//  APIRequestMethod.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

enum APIRequestMethod {
    case get
    case post
    case put
    case delete
    
    public func asHTTPMethod() -> String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}
