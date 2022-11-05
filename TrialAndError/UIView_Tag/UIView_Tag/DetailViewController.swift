//
//  DetailViewController.swift
//  UIView_Tag
//
//  Created by uiskim on 2022/10/26.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var dummy: Dummy? {
        didSet {
            guard let dummy = dummy else { return }
            titleLabel.text = dummy.title
            date.text = dummy.date
            view.backgroundColor = dummy.color
        }
    }
    
    let titleLabel = UILabel()
    let date = UILabel()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .black
        titleLabel.textAlignment = .center
        date.textColor = .white
        date.backgroundColor = .orange
        date.textAlignment = .center
        view.addSubview(titleLabel)
        view.addSubview(date)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
        
        date.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(-400)
            make.size.equalTo(200)
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
