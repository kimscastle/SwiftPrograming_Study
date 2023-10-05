//
//  HomeViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

protocol HomeNavigation: AnyObject {
    func logoutButtonTapped()
    func productListButtonTapped()
}

class HomeViewController: UIViewController {
    
    weak var coordinator: HomeNavigation!
    
    init(coordinator: HomeNavigation) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "홈뷰컨입니다"
        return label
    }()
    
    lazy var productListButton: UIButton = {
        let button = UIButton()
        button.setTitle("물품리스트보러가기", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(productListButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(homeLabel)
        view.addSubview(productListButton)
        view.addSubview(logoutButton)
        
        homeLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        productListButton.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(productListButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func logoutButtonTapped() {
        UserDefaults.standard.set(false, forKey: "isLogined")
        print("유저가 로그아웃했습니다")
        coordinator.logoutButtonTapped()
    }
    
    @objc func productListButtonTapped() {
        coordinator.productListButtonTapped()
    }
}
