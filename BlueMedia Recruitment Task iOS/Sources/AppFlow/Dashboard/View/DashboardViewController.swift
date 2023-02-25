//
//  DashboardViewController.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import RxCocoa
import RxSwift
import UIKit

final class DashboardViewController: UIViewController {
    
    private let dashboardView: DashboardView
    private let viewModel: DashboardViewModelProtocol
    
    private let disposeBag = DisposeBag()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(
        view: DashboardView,
        viewModel: DashboardViewModelProtocol) {

        self.dashboardView = view
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        view = dashboardView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindSearchBarDelegate()
        bindSearchResults()
    }
    
}

private extension DashboardViewController {

    private func bindSearchResults() {
        viewModel.searchResults
            .drive(onNext: {
                [weak self] searchResults in
                self?.updateSearchResultsHeader(using: searchResults)
            })
            .disposed(by: disposeBag)
        
        viewModel.searchResults
            .drive(dashboardView.sectionSearchResults.tableView.rx.items(
                cellIdentifier: String(describing: SearchResultTableViewCell.self),
                cellType: SearchResultTableViewCell.self)) {
                    [weak self] row, searchResult, cell in
                    self?.configureTableViewCell(cell, with: searchResult)
                }
            .disposed(by: disposeBag)
    }

    private func updateSearchResultsHeader(using searchResults: [SearchResult]) {
        let searchResultsView = dashboardView.sectionSearchResults
        searchResultsView.headerLabel.isHidden = false
        searchResultsView.headerLabel.text = searchResults.count > 0 ?
            Localized.searchResultsTitle : Localized.searchNoResultsTitle
    }
    
    private func configureTableViewCell(
        _ cell: SearchResultTableViewCell,
        with searchResult: SearchResult) {

        let searchResultView = SearchResultViewFactory.make(using: searchResult)
        cell.searchResult = searchResultView
        bindTextViewDelegate(for: cell)
    }
}

extension DashboardViewController: UISearchBarDelegate {

    private func bindSearchBarDelegate() {
        dashboardView.sectionSearch.searchBarView.searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBarResignFromFirstResponder()
        
        guard let text = searchBar.text else {
            return
        }

        viewModel.searchEngine(text: text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarResignFromFirstResponder()
    }
    
    private func searchBarResignFromFirstResponder() {
        dashboardView.sectionSearch.searchBarView.searchBar.resignFirstResponder()
    }
}

extension DashboardViewController: UITextViewDelegate {
    
    private func bindTextViewDelegate(for cell: SearchResultTableViewCell) {
        cell.searchResult?.titleTextView.delegate = self
    }
    
    func textView(_ textView: UITextView,
        shouldInteractWith URL: URL,
        in characterRange: NSRange,
        interaction: UITextItemInteraction) -> Bool {

        UIApplication.shared.open(URL)
        return false
    }
}
