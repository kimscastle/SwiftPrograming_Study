//
//  RegisterViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class RegisterViewController: UIViewController {
    
    weak var coordinator: AuthCoordinator!
    
    init(coordinator: AuthCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입을 완료했습니다 로그인뷰로 돌아가세요"
        return label
    }()
    
    lazy var goLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인으로 돌아가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("auth코디네이터")
        print(coordinator.navigationController.viewControllers)
        view.backgroundColor = .white
        view.addSubview(registerLabel)
        view.addSubview(goLoginButton)
        
        
        registerLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        goLoginButton.snp.makeConstraints { make in
            make.top.equalTo(registerLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
    
    @objc func loginButtonTapped() {
        UserDefaults.standard.set(true, forKey: "isLogined")
        print("유저가 로그인했습니다")
        self.coordinator.goToHomeViewController()
    }
}
