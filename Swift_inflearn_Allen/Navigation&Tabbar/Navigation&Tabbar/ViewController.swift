//
//  ViewController.swift
//  Navigation&Tabbar
//
//  Created by uiskim on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {

    private let label: UILabel = {
        let v = UILabel()
        v.text = "viewcontroller"
        v.font = .systemFont(ofSize: 50)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        // Do any additional setup after loading the view.
    }

}

