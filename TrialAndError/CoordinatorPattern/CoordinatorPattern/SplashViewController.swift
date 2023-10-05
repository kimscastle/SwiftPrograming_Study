//
//  SplashViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/03.
//

import UIKit

class SplashViewController: UIViewController {
    
    weak var coordinator: IntroCoordinator!
    
    private let splashLabel: UILabel = {
        let label = UILabel()
        label.text = "스플래시뷰입니다"
        return label
    }()
    
    init(coordinator: IntroCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { [weak self] in
            UIView.animate(withDuration: 0.4) {
                self?.view.layer.opacity = 0
            } completion: { _ in
                let isLogined = UserDefaults.standard.bool(forKey: "isLogined")
                if isLogined {
                    print("유저가 이전에 로그인했었기 때문에 홈뷰로 이동합니다")
                    self?.coordinator.showHomeTabView()
                } else {
                    print("유저가 이전에 로그인하지 않았기 때문에 홈뷰로 이동합니다")
                    self?.coordinator.showLoginView()
                }
            }
        }
    }
}
