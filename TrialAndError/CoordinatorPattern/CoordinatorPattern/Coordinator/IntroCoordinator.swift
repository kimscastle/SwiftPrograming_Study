//
//  IntroCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/05.
//

import UIKit

final class IntroCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showSplashView()
    }
    
    func showSplashView() {
        let splashViewController = SplashViewController(coordinator: self)
        navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func showLoginView() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        navigationController.viewControllers.removeAll()
        appCoordinator.startAuthCoordinator()
    }
    
    func showHomeTabView() {
        let appCorrdinator = parentCoordinator as! AppCoordinator
        navigationController.viewControllers.removeAll()
        appCorrdinator.startHomeTabbarCoordinator()
    }
}

extension IntroCoordinator: SplashNavigation {
    func loginButtonTapped(isLogined: Bool) {
        if isLogined {
            showHomeTabView()
        } else {
            showLoginView()
        }
    }
}
