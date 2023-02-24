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
    
    private var textfieldView: UITextField = UITextField().then {
        $0.backgroundColor = .white
        $0.placeholder = "입력해주세요"
    }
    
    private var testButton: UIButton = UIButton().then {
        $0.makeCustomButton(title: "Send Data", cornerRadius: 10, fontSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.addTarget(self, action: #selector(testButtonTapped), for: .touchUpInside)
        view.backgroundColor = .black
        
        view.addSubview(textfieldView)
        textfieldView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.rectSize(width: 150, height: 50)
        }
    }
}

extension NextViewController {
    @objc func testButtonTapped() {
        guard let text = textfieldView.text, !text.isEmpty else {
            print("글자를 입력해주세요")
            return
        }
        NotificationCenter.default.post(name: .testButtonTapped, object: text)
        navigationController?.popViewController(animated: true)
    }
}
