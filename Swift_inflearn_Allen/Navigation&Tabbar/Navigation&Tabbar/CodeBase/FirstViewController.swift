//
//  FirstViewController.swift
//  Navigation&Tabbar
//
//  Created by uiskim on 2022/10/06.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    lazy private var nextButton: UIButton = {
        let v = UIButton()
        v.setTitle("next", for: .normal)
        v.setTitleColor(.white, for: .normal)
        v.backgroundColor = .blue
        view.addSubview(v)
        v.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        setNavigationUI("첫번째화면")
    }


        
    private func makeUI() {
        view.backgroundColor = .lightGray
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }
    }
        
    private func setNavigationUI(_ title: String) {
        let appearnce = UINavigationBarAppearance()
        appearnce.backgroundColor = .white
        navigationController?.navigationBar.scrollEdgeAppearance = appearnce
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.topItem?.title = title
        
    }
    
    @objc func nextButtonTapped() {
        let nextVC = ErrorViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
