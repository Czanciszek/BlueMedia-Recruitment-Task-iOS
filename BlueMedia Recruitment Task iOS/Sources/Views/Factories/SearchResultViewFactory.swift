//
//  SearchResultViewFactory.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import Foundation

enum SearchResultViewFactory {
    static func make(using searchResult: SearchResult) -> SearchResultView {
        let view = SearchResultView()
        
        let textViewTitle = AttributedTextFactory.makeLinkTitle(
            for: searchResult.title,
            url: URL(string: searchResult.urlLink))
        view.titleTextView.attributedText = textViewTitle
        
        let previewText = searchResult.text
            .replacingOccurrences(of: "\\s+", with: " ", options: .regularExpression)
        view.descriptionPreviewLabel.text = previewText

        SearchResultViewDecorator.decorate(view)
        
        return view
    }
}
