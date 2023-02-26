//
//  DashboardViewController.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import Combine
import UIKit

final class DashboardViewController: UIViewController {
    
    private let dashboardView: DashboardView
    private let viewModel: DashboardViewModelProtocol
    
    private var searchResults: [SearchResult] = [] {
        didSet {
            reloadTableViewData()
        }
    }
    private var cancellables: Set<AnyCancellable> = []
    
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
        bindTableViewDelegate()
        
        bindSearchResults()
    }
    
}

private extension DashboardViewController {

    private func bindSearchResults() {
        viewModel.searchResults
            .dropFirst(1)
            .receive(on: DispatchQueue.main)
            .sink {
                [weak self] searchResults in
                self?.updateSearchResults(using: searchResults)
            }
            .store(in: &cancellables)
    }

    private func updateSearchResults(using searchResults: [SearchResult]) {
        self.searchResults = searchResults
        let searchResultsView = dashboardView.sectionSearchResults
        searchResultsView.headerLabel.isHidden = false
        searchResultsView.headerLabel.text = searchResults.count > 0 ?
            Localized.searchResultsTitle : Localized.searchNoResultsTitle
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

extension DashboardViewController: UITableViewDataSource {
    private func bindTableViewDelegate() {
        dashboardView.sectionSearchResults.tableView.dataSource = self
    }
    
    private func reloadTableViewData() {
        dashboardView.sectionSearchResults.tableView.reloadData()
    }
    
    private func configureTableViewCell(
        _ cell: SearchResultTableViewCell,
        with searchResult: SearchResult) {

        let searchResultView = SearchResultViewFactory.make(using: searchResult)
        cell.searchResult = searchResultView
        bindTextViewDelegate(for: cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: SearchResultTableViewCell.self))
                as? SearchResultTableViewCell else {
            return UITableViewCell()
        }

        let searchResult = searchResults[indexPath.row]
        configureTableViewCell(cell, with: searchResult)

        return cell
    }
}
