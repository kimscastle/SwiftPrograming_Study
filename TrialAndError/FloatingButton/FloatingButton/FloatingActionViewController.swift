//
//  FloatingActionViewController.swift
//  FloatingButton
//
//  Created by uiskim on 2023/06/25.
//

import UIKit

import SnapKit

class FloatingActionViewController: UIViewController {
    
    private var firstButtonSpacing: Constraint?
    private var secondButtonSpacing: Constraint?
    private var thirdButtonSpacing: Constraint?
    
    private let blurBackgroundView: UIVisualEffectView = {
        let blurView = UIVisualEffectView()
        blurView.effect = UIBlurEffect(style: .regular)
        return blurView
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add_icon_green"), for: .normal)
        return button
    }()
    
    private let firstFoodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "food1"), for: .normal)
        return button
    }()
    
    private let secondFoodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "food2"), for: .normal)
        return button
    }()
    
    private let thirdFoodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "food3"), for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(blurBackgroundView)
        view.addSubview(firstFoodButton)
        view.addSubview(secondFoodButton)
        view.addSubview(thirdFoodButton)
        view.addSubview(floatingButton)
        
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
        
        blurBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        floatingButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).offset(-40)
            make.trailing.equalToSuperview().inset(40)
            make.size.equalTo(60)
        }
        
        firstFoodButton.snp.makeConstraints { make in
            self.firstButtonSpacing = make.centerY.equalTo(floatingButton.snp.centerY).offset(0).constraint
            make.centerX.equalTo(floatingButton.snp.centerX)
            make.size.equalTo(50)
        }
        
        secondFoodButton.snp.makeConstraints { make in
            self.secondButtonSpacing = make.centerY.equalTo(floatingButton.snp.centerY).offset(0).constraint
            make.centerX.equalTo(floatingButton.snp.centerX)
            make.size.equalTo(50)
        }
        
        thirdFoodButton.snp.makeConstraints { make in
            self.thirdButtonSpacing = make.centerY.equalTo(floatingButton.snp.centerY).offset(0).constraint
            make.centerX.equalTo(floatingButton.snp.centerX)
            make.size.equalTo(50)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstButtonSpacing?.update(offset: -80)
        secondButtonSpacing?.update(offset: -160)
        thirdButtonSpacing?.update(offset: -240)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func floatingButtonTapped() {
        firstButtonSpacing?.update(offset: 0)
        secondButtonSpacing?.update(offset: 0)
        thirdButtonSpacing?.update(offset: 0)
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false)
        }

    }
}
