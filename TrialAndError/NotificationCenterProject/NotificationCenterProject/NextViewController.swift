//
//  NextViewController.swift
//  NotificationCenterProject
//
//  Created by uiskim on 2023/02/24.
//

import UIKit

import SnapKit
import Then

class NextViewController: UIViewController {
    
    private lazy var testButton: UIButton = UIButton().then {
        $0.setTitle("testButton", for: .normal)
        $0.backgroundColor = .blue
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
        $0.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }
}

extension NextViewController {
    @objc func testButtonTapped() {
        NotificationCenter.default.post(name: .testButtonTapped, object: "데이터전달완료")
        navigationController?.popViewController(animated: true)
    }
}
