//
//  AppCoordinator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let appMainFactory: AppMainProducing

    init(window: UIWindow, appMainFactory: AppMainProducing) {
        self.window = window
        self.appMainFactory = appMainFactory
    }

    override func start() {
        startDashboard()
    }
}

private extension AppCoordinator {

    func startDashboard() {
        let dashboardCoordinator = appMainFactory.makeDashboardCoordinator()
        start(coordinator: dashboardCoordinator)

        window.rootViewController = dashboardCoordinator.navigationController
    }
}
