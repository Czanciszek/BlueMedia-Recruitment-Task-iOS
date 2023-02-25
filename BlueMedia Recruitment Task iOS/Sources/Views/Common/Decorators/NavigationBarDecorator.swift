//
//  NavigationBarDecorator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

struct NavigationBarDecorator {

    static func decorate(navigationBar: UINavigationBar) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColor.white.asUIColor()
        
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.tintColor = AppColor.white.asUIColor()
    }
}

