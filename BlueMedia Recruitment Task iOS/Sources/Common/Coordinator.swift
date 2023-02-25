//
//  Coordinator.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }

    func start()
}

class Coordinator: CoordinatorProtocol {
    private var childCoordinators: [String: CoordinatorProtocol] = [:]
    
    var initialViewController: UIViewController {
        fatalError("Initial view controller is not implemented")
    }
    
    private(set) lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        NavigationBarDecorator.decorate(navigationBar: navigationController.navigationBar)
        return navigationController
    }()
    
    func start() {
        navigationController.pushViewController(initialViewController, animated: true)
    }

    func start(coordinator: CoordinatorProtocol) {
        let coordinatorName = String(describing: coordinator.self)
        childCoordinators[coordinatorName] = coordinator
        coordinator.start()
    }
}
