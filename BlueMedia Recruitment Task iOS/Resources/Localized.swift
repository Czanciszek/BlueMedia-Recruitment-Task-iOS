//
//  Localized.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import Foundation

enum Localized {
    
    static let searchTitle = Localized.tr("search-title")
    static let searchPlaceholder = Localized.tr("search-placeholder")
    
    static let searchResultsTitle = Localized.tr("search-results-title")
    static let searchNoResultsTitle = Localized.tr("search-no-results-title")

    static let errorAlertTitle = Localized.tr("error-alert-title")
    static let errorAlertCloseButtonTitle = Localized.tr("error-alert-close-button-title")
}

extension Localized {
  private static func tr(
    _ key: String,
    _ comment: String = "",
    tableName: String = "Localizable",
    args: CVarArg...) -> String {

    let format = NSLocalizedString(key, tableName: tableName, comment: comment)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
