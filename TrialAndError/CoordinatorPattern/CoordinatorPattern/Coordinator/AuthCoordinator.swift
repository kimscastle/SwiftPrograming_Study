//
//  AuthCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

final class AuthCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        showLoginView()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func showLoginView() {
        let loginViewController = LoginViewController(coordinator: self)
        self.navigationController.pushViewController(loginViewController, animated: false)
    }
}

extension AuthCoordinator: LoginNavigation, RegisterNaviation {
    func loginButtonTapped() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startHomeTabbarCoordinator()
    }
    
    func registerButtonTapped() {
        let registerViewController = RegisterViewController(coordinator: self)
        navigationController.pushViewController(registerViewController, animated: true)
    }
}
