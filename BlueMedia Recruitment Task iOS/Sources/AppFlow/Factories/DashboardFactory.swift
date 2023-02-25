//
//  DashboardFactory.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import UIKit

final class DashboardFactory: DashboardProducing {
    
    typealias Dependencies = DashboardViewModel.Dependencies

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    func makeDashboardViewController(coordinator: DashboardCoordinator) -> UIViewController {
        let view = DashboardViewFactory.make()

        let viewModel = DashboardViewModel(dependencies: dependencies)
        viewModel.coordinator = coordinator

        return DashboardViewController(
            view: view,
            viewModel: viewModel)
    }
    
    func makeErrorViewController(error: Error) -> UIViewController {
        let alertController = UIAlertController(
            title: Localized.errorAlertTitle,
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: Localized.errorAlertCloseButtonTitle, style: .default)
        alertController.addAction(action)
        
        return alertController
    }
}

