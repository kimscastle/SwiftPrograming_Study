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
    
    private var testLabel: UILabel = UILabel().then {
        $0.text = "Hello World"
        $0.textAlignment = .center
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private lazy var testButton: UIButton = UIButton().then {
        $0.makeCustomButton(title: "Next", cornerRadius: 10, fontSize: 20)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        testButton.addTarget(self, action: #selector(testButtonTapped(_:)), for: .touchUpInside)
        NotificationCenter.default.addObserver(self, selector: #selector(recieveTestButtonNotification(_:)), name: .testButtonTapped, object: nil)
        setUI()
    }
    
    private func setUI() {
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        
        view.addSubview(testButton)
        testButton.snp.makeConstraints { make in
            make.top.equalTo(testLabel.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.rectSize(width: 120, height: 50)
        }
    }
    
    @objc func recieveTestButtonNotification(_ notification: Notification) {
        guard let text = notification.object as? String else {
            return
        }
        testLabel.text = text
    }
    
    @objc func testButtonTapped(_ sender: Any) {
        let nextVC = NextViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}


extension Notification.Name {
    static let testButtonTapped = Notification.Name("aa")
}

