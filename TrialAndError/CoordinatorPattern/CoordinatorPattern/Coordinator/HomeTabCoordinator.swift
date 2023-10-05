//
//  HomeTabCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

final class HomeTabCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToHomeTabbar()
    }
    
    func goToHomeTabbar() {
        let tabbarController = UITabBarController()
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(navigationController: homeNavigationController)
        homeCoordinator.parentCoordinator = parentCoordinator
        let homeItem = UITabBarItem()
        homeItem.title = "HOME"
        homeItem.image = UIImage.init(systemName: "house.fill")
        homeNavigationController.tabBarItem = homeItem
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(navigationController: profileNavigationController)
        profileCoordinator.parentCoordinator = parentCoordinator
        let profileItem = UITabBarItem()
        profileItem.title = "PROFILE"
        profileItem.image = UIImage.init(systemName: "person.fill")
        profileNavigationController.tabBarItem = profileItem
        
        tabbarController.viewControllers = [homeNavigationController, profileNavigationController]
        navigationController.viewControllers.removeAll()
        navigationController.pushViewController(tabbarController, animated: true)
        navigationController.isNavigationBarHidden = true
        parentCoordinator?.children.append(homeCoordinator)
        parentCoordinator?.children.append(profileCoordinator)
        
        homeCoordinator.start()
        profileCoordinator.start()
    }
}
