//
//  TestViewController.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

import SnapKit

class TestViewController: UIViewController {
    
    let btn: UIButton = {
        let btn = UIButton()
        btn.setTitle("ㅎㅎㅎ", for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .red
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(aa), for: .touchUpInside)
        tvingNavigationBar(.white, left: [btn], right: [], spacing: 10)
    }
    
    @objc func aa() {
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
