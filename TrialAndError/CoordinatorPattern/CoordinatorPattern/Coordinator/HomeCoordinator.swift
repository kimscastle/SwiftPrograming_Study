//
//  HomeCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/03.
//

import UIKit

final class HomeCoordinator: Coordinator {
    var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    func start() {
        print("홈코디네이터시작")
        goToHome()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("홈코디네이터해제")
    }
    

}

extension HomeCoordinator: HomeNavigation {
    func goToHome() {
        let homeViewController = HomeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func goToChooseProductViewController() {
        let chooseProductViewController = ChooseProductViewController(coordinator: self)
        navigationController.pushViewController(chooseProductViewController, animated: true)
        
    }
    
    func goToProductListViewController() {
        let productListViewController = ProductListViewController(coordinator: self)
        navigationController.pushViewController(productListViewController, animated: true)
    }
    
    func goToLogin() {
        let appCoordinator = parentCoordinator as! AppCoordinator
        appCoordinator.startAuthCoordinator()
        appCoordinator.childDidFinish(self)
    }
    
    func backToHome() {
        navigationController.popToRootViewController(animated: true)
    }
}
