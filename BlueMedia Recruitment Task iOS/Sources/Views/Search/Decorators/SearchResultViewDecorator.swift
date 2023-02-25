//
//  SearchResultViewDecorator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import Foundation
import UIKit

enum SearchResultViewDecorator {
    static func decorate(_ view: SearchResultView) {

        view.backgroundColor = AppColor.white.asUIColor()

        view.titleTextView.backgroundColor = AppColor.white.asUIColor()
        view.titleTextView.font = AppFont.systemBold(.large).font
        view.titleTextView.linkTextAttributes = [
            .foregroundColor: AppColor.dark.asUIColor()
        ]

        view.descriptionPreviewLabel.font = AppFont.system(.medium).font
        view.descriptionPreviewLabel.textColor = AppColor.dark.asUIColor()
    }
}
