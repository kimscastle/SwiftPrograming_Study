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
}

extension AuthCoordinator {
    
    func showLoginView() {
        let loginViewController = LoginViewController(coordinator: self)
        self.navigationController.pushViewController(loginViewController, animated: false)
    }
    
    
    func goToRegisterViewController() {
        let registerViewController = RegisterViewController(coordinator: self)
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func goToHomeViewController() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startHomeTabbarCoordinator()
    }
}
