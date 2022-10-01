//
//  FirstViewController.swift
//  HowToMoveScreen
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    //MARK : - 이전 view에서 넘어온 string을 받을 변수(옵셔널로 선언하는경우가 많음)
    // 아니면 생성자로 초기화를 해줘야한다
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        render()

    }
    
    func render() {
        //MARK : - ".text"가 이미 옵셔널 타입이기때문에 someString을 언래핑하지 않아도 괜찮음
        mainLabel.text = someString
        view.addSubview(mainLabel)
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(backButton)
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true

    }
    
    //MARK : - 뒤로가기 버튼
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    

}
