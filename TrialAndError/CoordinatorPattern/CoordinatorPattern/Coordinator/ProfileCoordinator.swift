//
//  ProfileCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/03.
//

import UIKit

final class ProfileCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        goToProfile()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToProfile() {
        let profileViewController = ProfileViewController()
        profileViewController.coordinator = self
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
        
extension ProfileCoordinator: ProfileNavigation {
    func resignButtonTapped() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startIntroCoordinator()
    }
}
