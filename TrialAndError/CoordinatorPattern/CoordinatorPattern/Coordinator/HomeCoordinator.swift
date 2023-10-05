//
//  HomeCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/03.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        showHomeView()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension HomeCoordinator {
    func showHomeView() {
        let homeViewController = HomeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showChooseProductViewController() {
        let chooseProductViewController = ChooseProductViewController(coordinator: self)
        navigationController.pushViewController(chooseProductViewController, animated: true)
        
    }
    
    func showProductListViewController() {
        let productListViewController = ProductListViewController(coordinator: self)
        navigationController.pushViewController(productListViewController, animated: true)
    }
    
    func logout() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startIntroCoordinator()
    }
    
    func backToHome() {
        navigationController.popToRootViewController(animated: true)
    }
}
