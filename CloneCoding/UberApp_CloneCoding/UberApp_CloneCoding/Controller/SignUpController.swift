//
//  SignUpController.swift
//  UberApp_CloneCoding
//
//  Created by uiskim on 2023/03/04.
//

import UIKit

import SnapKit
import Then

class SignUpController: UIViewController {
    
    // MARK: - Properties
    private let titleLabel: UILabel = UILabel().then {
        $0.text = "UBER"
        $0.font = UIFont(name: "Avenir-Light", size: 36)
        $0.textColor = UIColor(white: 1, alpha: 0.8)
    }
    
    private lazy var emailContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_mail_outline_white_2x")!, textfield: emailTextField)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var fullNameContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_person_outline_white_2x")!, textfield: fullNameTextField)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var passwordContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_lock_outline_white_2x")!, textfield: passwordTextField)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var accountTypeContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_account_box_white_2x")!, segmentControl: accountTypeSegmentControl)
        $0.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private let emailTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Email",
                     isSecureTextEntry: false)
    }
    
    private let fullNameTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Fullname",
                     isSecureTextEntry: true)
    }
    
    private let passwordTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Password",
                     isSecureTextEntry: true)
    }
    
    private let accountTypeSegmentControl: UISegmentedControl = UISegmentedControl(items: ["Rider", "Driver"]).then {
        $0.backgroundColor = .backgroundColor
        $0.tintColor = UIColor(white: 1, alpha: 0.87)
        $0.selectedSegmentIndex = 0
    }
    
    
    private let loginButton: AuthButton = AuthButton(type: .system).then {
        $0.setTitle("Sign Up", for: .normal)
    }
    
    private lazy var alreadyHaveAccountButton: UIButton = UIButton(type: .system).then {
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSMutableAttributedString(string: "Sign Up",
                                                         attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                                      NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        $0.setAttributedTitle(attributedTitle, for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 32).isActive = true
        $0.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helper Functions
    private func configureUI() {
        view.backgroundColor = .backgroundColor
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        let loginStackView = UIStackView(arrangedSubviews: [emailContainerView,
                                                            fullNameContainerView,
                                                            passwordContainerView,
                                                            accountTypeContainerView,
                                                            loginButton])
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillProportionally
        loginStackView.spacing = 24
        
        view.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
