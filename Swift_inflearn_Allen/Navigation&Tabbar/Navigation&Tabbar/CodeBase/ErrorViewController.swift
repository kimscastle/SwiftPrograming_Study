//
//  ErrorViewController.swift
//  Navigation&Tabbar
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

class ErrorViewController: UIViewController {
    
    lazy private var secondNextButton: UIButton = {
        let v = UIButton()
        v.setTitle("next2", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        view.addSubview(v)
        v.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return v
    }()
    
    lazy private var nextButton: UIButton = {
        let v = UIButton()
        v.setTitle("back", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        view.addSubview(v)
        v.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        makeUI()
        setNavigationUI("두번째 화면")
    }
    
    private func makeUI() {
        view.backgroundColor = .lightGray
        secondNextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            // centerX는 top기준(offset사용)
            make.centerX.equalToSuperview()
            // centerY는 left기준(offset사용)
            make.centerY.equalToSuperview().offset(100)
        }
    }
        
    private func setNavigationUI(_ title: String) {
        let appearnce = UINavigationBarAppearance()
        appearnce.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearnce
        navigationController?.navigationBar.isTranslucent = false
        self.title = title
        //MARK : - 이미 navigationbar top item title을 교체한다
        // navigationController?.navigationBar.topItem?.title = title
        
        
    }
    
    @objc func nextButtonTapped() {
        let nextVC = TestViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    deinit {
        print("ggg")
    }
}
