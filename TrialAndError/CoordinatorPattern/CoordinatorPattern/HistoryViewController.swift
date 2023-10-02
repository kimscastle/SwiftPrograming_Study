//
//  HistoryViewController.swift
//  CoordinatorPattern
//
//  Created by uiskim on 2023/10/02.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyLabel: UILabel = {
        let label = UILabel()
        label.text = "히스토리뷰입니다"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(historyLabel)
        historyLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
