//
//  TestViewController.swift
//  Navigation&Tabbar
//
//  Created by uiskim on 2022/10/05.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let loginButton: UIButton = {
        let v = UIButton()
        v.setTitle("Login", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        v.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return v
    }()  

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        view.backgroundColor = .white
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
    }
    
    //MARK : - 코드로 탭바+네비게이션바 설정
    @objc func loginButtonTapped() {
        // 탭바컨트롤러의 생성
        let tabBarVC = UITabBarController()
        
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewController()
        
        // 탭바 이름들 설정
        vc1.title = "Main"
        vc2.title = "Search"
        vc3.title = "Post"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "square.and.arrow.up")
        items[1].image = UIImage(systemName: "folder")
        items[2].image = UIImage(systemName: "paperplane")
        
        // 프리젠트로 탭바를 띄우기
        present(tabBarVC, animated: true, completion: nil)
        
    }
}
