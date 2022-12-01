//
//  ViewController.swift
//  LottoRandomNumberView
//
//  Created by uiskim on 2022/12/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let testView = LottoNumbersView(numbers: [1,2,3,4])
    
    lazy var changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로또 번호 바꾸기", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(changeButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(testView)
        testView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(changeButton)
        changeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(80)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }

    @objc func changeButtonTapped() {
        changeRandomNumbers()
    }
    
    private func changeRandomNumbers() {
        testView.lottoNumbers = Int.makeRandomIntArray(count: 4)
    }

}

