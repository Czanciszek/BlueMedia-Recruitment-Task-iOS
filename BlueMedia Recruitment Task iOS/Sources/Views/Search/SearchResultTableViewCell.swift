//
//  SearchResultTableViewCell.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import UIKit

final class SearchResultTableViewCell: UITableViewCell {

    var searchResult: SearchResultView? {
        didSet {
            setupContentView()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
    }

}

private extension SearchResultTableViewCell {
    
    func setupContentView() {
        resetHierarchy()
        constructHierarchy()

        prepareSearchResult()
    }
    
    func resetHierarchy() {
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func constructHierarchy() {
        guard let searchResult else {
            return
        }

        contentView.addSubview(searchResult)
    }
    
    func prepareSearchResult() {
        guard let searchResult else {
            return
        }
        
        searchResult.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchResult.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Margin.medium),
            searchResult.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Margin.medium),
            searchResult.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Margin.medium),
            searchResult.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Margin.medium)
        ])
    }
}
