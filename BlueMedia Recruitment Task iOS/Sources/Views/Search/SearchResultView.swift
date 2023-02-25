//
//  SearchResultView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import UIKit

final class SearchResultView: UIView {
    private enum Constants {
        static let textViewHeight: CGFloat = 80
    }
    
    private let mainStackView = UIStackView()
    
    let titleTextView = UITextView()
    let descriptionPreviewLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
}

private extension SearchResultView {
    
    func setupView() {
        constructHierarchy()

        prepareMainStackView()
        prepareTitle()
        prepareDescriptionPreview()
    }
    
    private func constructHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(titleTextView)
        mainStackView.addArrangedSubview(descriptionPreviewLabel)
    }
    
    private func prepareMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.alignment = .leading
        mainStackView.spacing = Margin.small

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor)
        ])
    }

    private func prepareTitle() {
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        titleTextView.textAlignment = .center
        titleTextView.isScrollEnabled = false
        titleTextView.isEditable = false
        titleTextView.textContainer.maximumNumberOfLines = 2
        titleTextView.textContainer.lineBreakMode = .byTruncatingTail
        
        NSLayoutConstraint.activate([
            titleTextView.heightAnchor.constraint(
                equalToConstant: Constants.textViewHeight)
        ])
    }
    
    private func prepareDescriptionPreview() {
        descriptionPreviewLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionPreviewLabel.lineBreakMode = .byTruncatingTail
        descriptionPreviewLabel.numberOfLines = 2
    }
}
