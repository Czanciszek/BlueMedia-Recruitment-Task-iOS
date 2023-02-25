//
//  DashboardProducing.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 24/02/2023.
//

import UIKit

protocol DashboardProducing {
    func makeDashboardViewController(coordinator: DashboardCoordinator) -> UIViewController

    func makeErrorViewController(error: Error) -> UIViewController
}
