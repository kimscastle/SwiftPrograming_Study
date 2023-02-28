//
//  BaseViewController.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

import SnapKit
import Then

typealias BaseVC<T> = BaseViewController<T> where T: BaseViewModel

class BaseViewController<T>: UIViewController {

    let viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        configureUI()
        
    }
    
    func setUI() {}
    func configureUI() {}
}
