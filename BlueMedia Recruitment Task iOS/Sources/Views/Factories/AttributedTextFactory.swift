//
//  AttributedTextFactory.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import Foundation
import UIKit

enum AttributedTextFactory {
    
    static func makeLinkTitle(for string: String, url: URL?) -> NSAttributedString {

        let attributedString = NSMutableAttributedString(string: string)
        
        guard let url else {
            return attributedString
        }

        attributedString.setAttributes(
            [.link: url],
            range: NSMakeRange(0, attributedString.length))

        return attributedString
    }
}


