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
    
    func showHomeView() {
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeCoordinator: HomeNavigation, ProductListNavigation, ChooseProductNavigation {
    func goHomeButtonTapped() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func choseMyProductListButtonTapped() {
        let chooseProductViewController = ChooseProductViewController()
        chooseProductViewController.coordinator = self
        navigationController.pushViewController(chooseProductViewController, animated: true)
    }
    
    func logoutButtonTapped() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startIntroCoordinator()
    }
    
    func productListButtonTapped() {
        let productListViewController = ProductListViewController()
        productListViewController.coordinator = self
        navigationController.pushViewController(productListViewController, animated: true)
    }
}
