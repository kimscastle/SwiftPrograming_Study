//
//  TestViewController.swift
//  Navigation&Tabbar
//
//  Created by uiskim on 2022/10/05.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
    
    private let label: UILabel = {
        let v = UILabel()
        v.text = "TestViewController"
        v.font = .systemFont(ofSize: 50)
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
