//
//  HeaderLabelViewDecorator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

enum HeaderLabelViewDecorator {
    
    static func decorate(view: HeaderLabelView) {
        
        view.backgroundColor = AppColor.blue.asUIColor()
        
        view.headerColor = AppColor.white.asUIColor()
        view.headerFont = AppFont.systemBold(.large).font
    }
}
