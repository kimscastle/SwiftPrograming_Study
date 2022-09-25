//
//  SampleViewController.swift
//  Netflix_Login
//
//  Created by uiskim on 2022/09/25.
//

import UIKit

class SampleViewController: UIViewController {
    
    let emailTextFieldView: UIView = {
        let v = UIView()
        //MARK : - 반드시 설정해줘야함(실수많이함)
        // 코드로 UI를 구성하면 기본적으로 frame기준으로 앱 화면에 올라가게 되어있음 그 기능을 꺼줌
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .darkGray
        //MARK : - UIView의 corner를 둥굴게 만드는 메서드(두개 모두 설정해야함)
        v.layer.masksToBounds = true
        v.layer.cornerRadius = 8
        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
 
    func makeUI() {
        //MARK : - addSubView 클로저안에다가 넣고싶으면 lazy var로 선언하면 가능하다
        // 처음에 view가 생성된 후에야 addSubView가 사용이가능한데 lazy var의 경우엔 view가 먼저생성되고나서 생성되기때문에 가능
        view.addSubview(emailTextFieldView)
        
        emailTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emailTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emailTextFieldView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        emailTextFieldView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}


