//
//  SectionSearchView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

final class SectionSearchView: UIView {
    
    private let mainStackView = UIStackView()

    let headerLabel = HeaderLabelView()
    let searchBarView = SearchBarView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)

        backgroundColor = AppColor.blue.asUIColor()
        
        setupView()
    }
}

private extension SectionSearchView {
    
    func setupView() {
        constructHierarchy()

        prepareMainStackView()
        prepareHeader()
        prepareSearchBar()
    }
    
    private func constructHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(headerLabel)
        mainStackView.addArrangedSubview(searchBarView)
    }
    
    private func prepareMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            mainStackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }

    private func prepareHeader() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func prepareSearchBar() {
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBarView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor)
        ])
    }

}

