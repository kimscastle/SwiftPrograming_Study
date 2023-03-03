//
//  ViewController.swift
//  UberApp_CloneCoding
//
//  Created by uiskim on 2023/03/03.
//

import UIKit

import SnapKit
import Then

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let titleLabel: UILabel = UILabel().then {
        $0.text = "UBER"
        $0.font = UIFont(name: "Avenir-Light", size: 36)
        $0.textColor = UIColor(white: 1, alpha: 0.8)
    }
    
    private lazy var emailContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_mail_outline_white_2x")!, textfield: emailTextField)
        $0.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private lazy var passwordContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_lock_outline_white_2x")!, textfield: passwordTextField)
        $0.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private let emailTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Email",
                     isSecureTextEntry: false)
    }
    
    private let passwordTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Password",
                     isSecureTextEntry: true)
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        let loginStackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.spacing = 16
        
        view.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

