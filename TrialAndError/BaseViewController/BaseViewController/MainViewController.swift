//
//  MainViewController.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/23.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {

    private var testLabel: UILabel = UILabel().then {
        $0.text = "testLabel"
        $0.font = .systemFont(ofSize: 15)
        $0.tintColor = .blue
        $0.textAlignment = .center
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // 주입된 viewModel사용가능
        viewModel.deleteData(index: 1)
    }
    
    override func setUI() {
        view.addSubview(testLabel)
    }
    
    override func setConstraints() {
        testLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }
}

