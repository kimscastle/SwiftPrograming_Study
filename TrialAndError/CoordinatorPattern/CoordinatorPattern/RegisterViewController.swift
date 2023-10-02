//
//  RegisterViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class RegisterViewController: UIViewController {

    let registerLabel: UILabel = {
        let label = UILabel()
        label.text = "회원가입을 완료했습니다 로그인뷰로 돌아가세요"
        return label
    }()
    
    let goLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인으로 돌아가기", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
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

}
