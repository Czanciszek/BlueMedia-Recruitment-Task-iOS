//
//  HeaderLabelView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 25/02/2023.
//

import UIKit

final class HeaderLabelView: UIView {
    private enum Constants {
        static let headerEdgeInsets = UIEdgeInsets(
            top: 16,
            left: 24,
            bottom: 16,
            right: 24)
    }
    
    private let headerLabel = UILabel()
    
    var text: String? {
        get {
            return headerLabel.text
        }
        set {
            headerLabel.text = newValue
        }
    }
    
    var headerFont: UIFont? {
        didSet {
            headerLabel.font = headerFont
        }
    }

    var headerColor: UIColor? {
        didSet {
            headerLabel.textColor = headerColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
}

private extension HeaderLabelView {
    
    func setupView() {
        constructHierarchy()

        prepareHeader()
    }
    
    private func constructHierarchy() {
        addSubview(headerLabel)
    }

    private func prepareHeader() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.numberOfLines = 0
        headerLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: Constants.headerEdgeInsets.top),
            headerLabel.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.headerEdgeInsets.bottom),
            headerLabel.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.headerEdgeInsets.left),
            headerLabel.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.headerEdgeInsets.right)
        ])
    }
}
