//
//  ChooseProductViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit
import SnapKit

class ChooseProductViewController: UIViewController {
    
    weak var coordinator: ChooseProductNavigation!
    
    init(coordinator: ChooseProductNavigation) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let chooseProducLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 선택한 물건"
        return label
    }()
    
    lazy var goHomeButton: UIButton = {
        let button = UIButton()
        button.setTitle("홈으로 돌아가기", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
    
    @objc func buttonTapped() {
        coordinator.goHomeButtonTapped()
    }
}
