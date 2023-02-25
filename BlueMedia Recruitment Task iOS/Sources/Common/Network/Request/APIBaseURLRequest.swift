//
//  APIBaseURLRequest.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

enum APIBaseURLRequest: String {
    
    case blueMediaHelp = "https://pomoc.bluemedia.pl"
    
    var urlString: String {
        return rawValue
    }
}
