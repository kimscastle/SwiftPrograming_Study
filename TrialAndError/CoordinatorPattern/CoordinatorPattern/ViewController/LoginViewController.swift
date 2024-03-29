//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    weak var coordinator: LoginNavigation?
    
    private let LoginLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인뷰컨입니다"
        return label
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입하러가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

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
    
    @objc func loginButtonTapped() {
        UserDefaults.standard.set(true, forKey: "isLogined")
        print("유저가 로그인했습니다")
        coordinator?.loginButtonTapped()
    }
    
    @objc func registerButtonTapped() {
        coordinator?.registerButtonTapped()
    }
}


