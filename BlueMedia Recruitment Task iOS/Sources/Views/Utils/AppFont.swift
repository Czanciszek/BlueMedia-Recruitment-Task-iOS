//
//  AppFont.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

enum AppFont {
    
    case system(FontSize)
    
    case systemBold(FontSize)
    
    var font: UIFont {
        switch self {
        case .system(let size):
            return UIFont.systemFont(ofSize: size.rawValue)
        case .systemBold(let size):
            return UIFont.systemFont(ofSize: size.rawValue, weight: .bold)
        }
    }
}
