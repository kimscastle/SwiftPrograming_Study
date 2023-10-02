//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

import SnapKit

final class LoginViewController: UIViewController {
    
    private let LoginLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인뷰컨입니다"
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .orange
        return button
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입하러가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(LoginLabel)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        LoginLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(LoginLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
}
