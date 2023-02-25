//
//  SectionSearchResultsView.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 23/02/2023.
//

import UIKit

final class SectionSearchResultsView: UIView {
    private enum Constants {
        static let tableHeight: CGFloat = 600
        static let interitemSpacing: CGFloat = 16
    }
    
    private let mainStackView = UIStackView()
    
    let headerLabel = HeaderLabelView()
    let tableView = UITableView()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: .zero)

        backgroundColor = AppColor.blue.asUIColor()
        
        setupView()
    }
}

private extension SectionSearchResultsView {
    
    func setupView() {
        constructHierarchy()

        prepareMainStackView()
        prepareHeader()
        prepareTableView()
    }
    
    private func constructHierarchy() {
        addSubview(mainStackView)

        mainStackView.addArrangedSubview(headerLabel)
        mainStackView.addArrangedSubview(tableView)
    }
    
    private func prepareHeader() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.isHidden = true
    }

    private func prepareMainStackView() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .fill

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

    private func prepareTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(SearchResultTableViewCell.self,
            forCellReuseIdentifier: String(describing: SearchResultTableViewCell.self))

        NSLayoutConstraint.activate([
            tableView.heightAnchor.constraint(
                equalToConstant: Constants.tableHeight),
            tableView.widthAnchor.constraint(
                equalTo: mainStackView.widthAnchor)
        ])
    }

}
