//
//  ChooseProductViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class ChooseProductViewController: UIViewController {


    let chooseProducLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 선택한 물건"
        return label
    }()
    
    let goHomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("홈으로 돌아가기", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(chooseProducLabel)
        view.addSubview(goHomeButton)
        
        
        chooseProducLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        goHomeButton.snp.makeConstraints { make in
            make.top.equalTo(chooseProducLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
}
