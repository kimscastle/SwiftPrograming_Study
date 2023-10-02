//
//  ProfileViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필뷰입니다"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
