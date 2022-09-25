//
//  ViewController.swift
//  Netflix_Login
//
//  Created by uiskim on 2022/09/25.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK : - 이메일 입력하는 텍스트 뷰
    private lazy var emailTextFieldView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame.size.height = 48
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 5
        v.backgroundColor = .darkGray
        // 순서고려해야함
        v.addSubview(emailTextField)
        v.addSubview(emailInfoLabel)
        return v
    }()
    
    //MARK : - "이메일 또는 전화문구" 안내문구
    private var emailInfoLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "이메일주소 또는 전화번호"
        v.font = .systemFont(ofSize: 18)
        v.textColor = .white
        return v
    }()
    
    //MARK : - 이메일 입력 텍스트필드
    private lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.heightAnchor.constraint(equalToConstant: 48).isActive = true
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        // 맨앞에글자 대문자로 바꾸줄지 말지
        tf.autocapitalizationType = .none
        // 자동으로 틀린글자 수정해줄지 말지
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    
    //MARK : - 비밀번호 입력하는 텍스트뷰
    private lazy var passwordTextFieldView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        //v.heightAnchor.constraint(equalToConstant: 48).isActive = true
        v.frame.size.height = 48
        v.backgroundColor = .darkGray
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 5
        v.addSubview(passwordTextField)
        v.addSubview(passwordInfoLabel)
        v.addSubview(passwordSecureButton)
        
        return v
    }()

    //MARK : - 패스워드 텍스트필드의 안내문구
    private var passwordInfoLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "비밀번호"
        v.font = .systemFont(ofSize: 18)
        v.textColor = .white
        return v
    }()
    
    //MARK : - 비밀번호 입력 텍스트 필드
    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        //tf.heightAnchor.constraint(equalToConstant: 48).isActive = true
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        // 맨앞에글자 대문자로 바꾸줄지 말지
        tf.autocapitalizationType = .none
        // 자동으로 틀린글자 수정해줄지 말지
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        // 비밀번호 안보이게
        tf.isSecureTextEntry = true
        // 텍스트필드를 누르는순간 내용이 삭제됨
        tf.clearsOnBeginEditing = false
        return tf
    }()
    
    //MARK : - 패스워드의 "표시"버튼
    private let passwordSecureButton: UIButton = {
        let v = UIButton(type: .custom)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.setTitle("표시", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
        return v
    }()
    
    //MARK : - 로그인버튼
    private let loginButton: UIButton = {
        let v = UIButton(type: .custom)
        v.backgroundColor = .clear
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 1
        // borderColor는 cgColor로 설정해줘야함
        v.layer.borderColor = UIColor.darkGray.cgColor
        v.titleLabel?.font = .boldSystemFont(ofSize: 16)
        v.setTitle("로그인", for: .normal)
        // 우선은 비활성화 되어있는상태
        v.isEnabled = false
        return v
    }()
    
    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 18
        // 세로로 정렬할래 가로로 정렬할래
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    //MARK : - 비밀번호 재설정 버튼
    private let passwordResetButton: UIButton = {
        let v = UIButton(type: .custom)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame.size.height = 48
        v.backgroundColor = .clear
        v.setTitle("비밀번호 재설정", for: .normal)
        v.titleLabel?.font = .boldSystemFont(ofSize: 14)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        makeUI()
    }
 
    func makeUI() {
        view.addSubview(stackView)
        view.addSubview(passwordResetButton)
        
        emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
        emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8).isActive = true
        emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor).isActive = true
        
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: -8).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: -2).isActive = true
        
        passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8).isActive = true
        passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8).isActive = true
        passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor).isActive = true
        
        passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -2).isActive = true
        
        passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15).isActive = true
        passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15).isActive = true
        passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8).isActive = true
        
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 48*3+36).isActive = true
        
        passwordResetButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        passwordResetButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        passwordResetButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10).isActive = true
    }

}

