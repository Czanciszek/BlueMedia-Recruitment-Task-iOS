//
//  DashboardViewFactory.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

enum DashboardViewFactory {
    static func make() -> DashboardView {
        
        let view = DashboardView()
        view.backgroundColor = AppColor.white.asUIColor()
        
        view.sectionSearch.headerLabel.text = Localized.searchTitle
        HeaderLabelViewDecorator.decorate(view: view.sectionSearch.headerLabel)

        view.sectionSearch.searchBarView.searchBar.placeholder = Localized.searchPlaceholder

        HeaderLabelViewDecorator.decorate(view: view.sectionSearchResults.headerLabel)

        return view
    }
}
