//
//  ProfileViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    weak var coordinator: ProfileNavigation?

    let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필뷰입니다"
        return label
    }()
    
    lazy var resignButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(resignButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileLabel)
        view.addSubview(resignButton)
        profileLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        resignButton.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func resignButtonTapped() {
        UserDefaults.standard.set(false, forKey: "isLogined")
        coordinator?.resignButtonTapped()
    }
}
