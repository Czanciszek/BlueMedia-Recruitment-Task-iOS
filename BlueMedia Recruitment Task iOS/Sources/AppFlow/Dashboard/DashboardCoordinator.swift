//
//  DashboardCoordinator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

final class DashboardCoordinator: Coordinator {
    
    private let dashboardFactory: DashboardProducing
    
    private lazy var dashboardViewController: UIViewController = {
        return dashboardFactory.makeDashboardViewController(coordinator: self)
    }()

    override var initialViewController: UIViewController {
        return dashboardViewController
    }
    
    override func start() {
        navigationController.pushViewController(initialViewController, animated: true)
    }

    init(dashboardFactory: DashboardProducing) {
        self.dashboardFactory = dashboardFactory
    }
    
    func presentError(error: Error) {
        startError(error)
    }

}

private extension DashboardCoordinator {
    func startError(_ error: Error) {
        let errorVC = dashboardFactory.makeErrorViewController(error: error)
        navigationController.present(errorVC, animated: true)
    }
}
