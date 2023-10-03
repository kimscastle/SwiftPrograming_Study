//
//  ProductListViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class ProductListViewController: UIViewController {

    weak var coordinator: HomeNavigation!
    
    init(coordinator: HomeNavigation!) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productListLabel: UILabel = {
        let label = UILabel()
        label.text = "물품리스트입니다"
        return label
    }()
    
    lazy var chooseProductButton: UIButton = {
        let button = UIButton()
        button.setTitle("내가 고른 물건 보러가기", for: .normal)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(productListLabel)
        view.addSubview(chooseProductButton)
        productListLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        chooseProductButton.snp.makeConstraints { make in
            make.top.equalTo(productListLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
    
    @objc func buttonTapped() {
        coordinator.goToChooseProductViewController()
    }
}
