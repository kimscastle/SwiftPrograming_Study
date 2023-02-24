//
//  ViewController.swift
//  NotificationCenterProject
//
//  Created by uiskim on 2023/02/24.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    let testLabel: UILabel = UILabel().then {
        $0.text = "Hello World"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

