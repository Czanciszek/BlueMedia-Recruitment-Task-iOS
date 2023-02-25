//
//  DashboardView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

final class DashboardView: UIView {
    
    private let scrollView = UIScrollView()
    private let mainStackView = UIStackView()
    
    let sectionSearch = SectionSearchView()
    let sectionSearchResults = SectionSearchResultsView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)

        setupLayout()
    }
}

private extension DashboardView {
    
    func setupLayout() {
        constructHierarchy()

        prepareScrollView()
        prepareMainStackView()
        prepareSectionSearch()
        prepareSectionSearchResults()
    }
    
    private func constructHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(sectionSearch)
        mainStackView.addArrangedSubview(sectionSearchResults)
    }
    
    private func prepareScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func prepareMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: scrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor),
            mainStackView.widthAnchor.constraint(
                equalTo: widthAnchor)
        ])
    }
    
    private func prepareSectionSearch() {
        sectionSearch.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func prepareSectionSearchResults() {
        sectionSearchResults.translatesAutoresizingMaskIntoConstraints = false
    }
}
