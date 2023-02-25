//
//  AppMainFactory.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

final class AppMainFactory {
    private let dependencies = MainServicesContainer.instantiate()
}

extension AppMainFactory: AppMainProducing {

    func makeDashboardCoordinator() -> CoordinatorProtocol {

        let dashboardFactory = DashboardFactory(dependencies: dependencies)

        return DashboardCoordinator(dashboardFactory: dashboardFactory)
    }
}

