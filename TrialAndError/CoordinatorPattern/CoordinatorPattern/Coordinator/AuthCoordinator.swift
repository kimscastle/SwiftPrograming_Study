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
        print("auth탭코디네이터시작")
        goToLogin()
    }
    
    deinit {
        print("auth탭코디네이터해제")
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension AuthCoordinator: LoginNavigation {
    func goToRegisterViewController() {
        let registerViewController = RegisterViewController(coordinator: self)
        navigationController.pushViewController(registerViewController, animated: true)
    }
    
    func goToHomeViewController() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startHomeTabbarCoordinator()
        appCoordinator.childDidFinish(self)
    }
    
    func goToLogin() {
        let loginViewController = LoginViewController(coordinator: self)
        navigationController.pushViewController(loginViewController, animated: true)
    }
}
