//
//  HomeViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class HomeViewController: UIViewController {

    let homeLabel: UILabel = {
        let label = UILabel()
        label.text = "홈뷰컨입니다"
        return label
    }()
    
    let productListButton: UIButton = {
        let button = UIButton()
        button.setTitle("물품리스트보러가기", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
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
}
