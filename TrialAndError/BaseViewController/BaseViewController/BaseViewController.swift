//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/23.
//

import UIKit

import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setUI()
        setConstraints()
    }
    
    func setUI() {}
    func setConstraints() {}
}
