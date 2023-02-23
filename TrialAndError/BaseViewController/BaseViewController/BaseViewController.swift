//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/23.
//

import UIKit

import Then
import SnapKit

class BaseViewController: UIViewController {
    
    let a = UILabel().then { dd in
        dd.font = .systemFont(ofSize: 14)
        dd.text = "ㅎㅎㅎ"
        dd.
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setConstraints()
    }
    
    func setUI() {}
    func setConstraints() {}
}
