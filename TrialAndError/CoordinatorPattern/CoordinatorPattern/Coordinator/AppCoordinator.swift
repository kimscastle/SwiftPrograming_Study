//
//  AppCoordinator.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

final class AppCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    
    var children: [Coordinator] = [] {
        didSet {
            print("appCoordinator의 Child \(children)")
        }
    }
    
    var navigationController: UINavigationController
    
    func start() {
        print("앱코디네이터시작")
        startIntroCoordinator()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startAuthCoordinator() {
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        children.removeAll()
        authCoordinator.parentCoordinator = self
        children.append(authCoordinator)
        authCoordinator.start()
    }
    
    func startHomeTabbarCoordinator() {
        let homeTabbarCoordinator = HomeTabCoordinator(navigationController: navigationController)
        children.removeAll()
        homeTabbarCoordinator.parentCoordinator = self
        homeTabbarCoordinator.start()
    }
    
    func startIntroCoordinator() {
        let introCoordinator = IntroCoordinator(navigationController: navigationController)
        children.removeAll()
        introCoordinator.parentCoordinator = self
        children.append(introCoordinator)
        introCoordinator.start()
    }
    
    deinit {
        print("앱코디네이터해제")
    }
}
