//
//  AppColor.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

enum AppColor {
    
    case blue
    case dark
    case white
    
    func asUIColor() -> UIColor {
        return UIColor(hex: hexValue)
    }
    
    private var hexValue: UInt {
        switch self {
        case .blue:
            return 0x0068B4
        case .dark:
            return 0x343A40
        case .white:
            return 0xFFFFFF
        }
    }
}

extension UIColor {
    convenience init(hex: UInt) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}
