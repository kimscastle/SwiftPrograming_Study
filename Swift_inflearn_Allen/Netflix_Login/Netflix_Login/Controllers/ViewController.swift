//
//  ViewController.swift
//  Netflix_Login
//
//  Created by uiskim on 2022/09/25.
//

import UIKit
 
//MARK : - 대부분실무에서 viewContorller에는 final 각각의 요소에는 private을 쓰는게 좋다
final class ViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
 
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    //MARK : - 알람창 구현
    @objc func resetButtonTapped() {
        //print("리셋버튼이 눌렸습니다")
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀버호를 바꾸시겠습니까?", preferredStyle: .alert)
        let success = UIAlertAction(title: "확인", style: .default) { _ in
            print("확인버튼이 눌렸습니다.")
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
            print("취소버튼이 눌렸습니다")
        }
        alert.addAction(success)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    

    
    //MARK : - 로그인버튼이 눌리면
    @objc func loginButtonTapped() {
        print("로그인버튼이 눌렸습니다.")
        
    }


}


