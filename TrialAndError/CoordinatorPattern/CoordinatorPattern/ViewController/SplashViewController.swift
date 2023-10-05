//
//  SplashViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/03.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    weak var coordinator: SplashNavigation!
    
    init(coordinator: SplashNavigation) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let splashLabel: UILabel = {
        let label = UILabel()
        label.text = "스플래시뷰입니다"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = .white
        } completion: { _ in
            let isLogined = UserDefaults.standard.bool(forKey: "isLogined")
            self.coordinator.loginButtonTapped(isLogined: isLogined)
        }
    }
}
