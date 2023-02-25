//
//  AppDelegate.swift
//  BlueMedia Recruitment Task iOS
//
//  Created by Franciszek Czana on 22/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var coordinator: AppCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
        let navigationController = UINavigationController()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController

        let appMainFactory = AppMainFactory()
        coordinator = AppCoordinator(
            window: window,
            appMainFactory: appMainFactory)

        coordinator?.start()

        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}

