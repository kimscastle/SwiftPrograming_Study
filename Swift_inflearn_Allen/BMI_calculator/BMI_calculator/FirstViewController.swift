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

    override func viewDidLoad() {
        super.viewDidLoad()
        render()

    }
    
    func render() {
        mainLabel.text = "FirstViewController"
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
    
    @objc func backButtonTapped() {
        
    }
    


}
