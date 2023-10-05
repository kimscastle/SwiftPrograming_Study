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
        print("프로필코디네이터시작")
        goToProfile()
    }
    
    deinit {
        print("프로필코디네이터해제")
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToProfile() {
        let profileViewController = ProfileViewController(coordinator: self)
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
        
extension ProfileCoordinator: ProfileNavigation {
    func resign() {
        print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
    }
}
