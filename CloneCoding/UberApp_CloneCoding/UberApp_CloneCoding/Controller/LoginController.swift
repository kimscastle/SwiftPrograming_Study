//
//  LoginController.swift
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
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var passwordContainerView: UIView = UIView().then {
        $0.inputContainerView(image: UIImage(named: "ic_lock_outline_white_2x")!, textfield: passwordTextField)
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private let emailTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Email",
                     isSecureTextEntry: false)
    }
    
    private let passwordTextField: UITextField = UITextField().then {
        $0.textField(withPlaceholder: "Password",
                     isSecureTextEntry: true)
    }
    
    private let loginButton: AuthButton = AuthButton(type: .system).then {
        $0.setTitle("Log In", for: .normal)
    }
    
    private lazy var dontHaveAccountButton: UIButton = UIButton(type: .system).then {
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ",
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSMutableAttributedString(string: "Sign Up",
                                                         attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                                      NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        
        $0.setAttributedTitle(attributedTitle, for: .normal)
        $0.heightAnchor.constraint(equalToConstant: 32).isActive = true
        $0.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    /// 네비게이션바 style이 black이면 자동으로 StatusBar Style이 lightContent로 설정된다
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
    
    // MARK: - Selector
    @objc func handleShowSignUp() {
        let controller = SignUpController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Helper Functions
    private func configureUI() {
        configureNavigationBar()
        view.backgroundColor = .backgroundColor

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        let loginStackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.spacing = 24
        
        view.addSubview(loginStackView)
        loginStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
}

