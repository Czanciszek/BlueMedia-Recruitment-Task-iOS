//
//  SearchBarView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

final class SearchBarView: UIView {
    private enum Constants {
        static let cornerRadius: CGFloat = 12
    }

    let searchBar = UISearchBar()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
}

private extension SearchBarView {
    
    private func setupView() {
        constructHierarchy()

        prepareSearchBar()
    }
    
    private func constructHierarchy() {
        addSubview(searchBar)
    }

    private func prepareSearchBar() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.layer.cornerRadius = Constants.cornerRadius
        searchBar.clipsToBounds = true
        searchBar.showsCancelButton = true
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(
                equalTo: topAnchor),
            searchBar.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -Margin.medium),
            searchBar.centerXAnchor.constraint(
                equalTo: centerXAnchor),
            searchBar.widthAnchor.constraint(
                equalTo: widthAnchor,
                constant: -Margin.medium),
        ])
    }
}
