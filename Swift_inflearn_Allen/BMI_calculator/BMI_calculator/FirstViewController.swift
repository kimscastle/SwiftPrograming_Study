//
//  FirstViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/09/30.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    //MARK : - 이전 view에서 넘어온 string을 받을 변수(옵셔널로 선언하는경우가 많음)
    // 아니면 생성자로 초기화를 해줘야한다
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        render()

    }
    
    func render() {
        //MARK : - ".text"가 이미 옵셔널 타입이기때문에 someString을 언래핑하지 않아도 괜찮음
        mainLabel.text = someString
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .blue
        backButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(70)
            make.bottom.equalToSuperview().inset(40)
        }
    }
    
    //MARK : - 뒤로가기 버튼
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    


}
