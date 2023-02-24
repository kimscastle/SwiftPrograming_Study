//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/23.
//

import UIKit

import SnapKit
import Then

// MARK: - BaseViewController<T>는 ViewController를 상속하고 BindVIewModelProtocol을 채택한 타입이다
// 이때 T는 generic이고 ViewController가 class이기때문에 class에서 generic은 사용할때 T에 타입을 명시를 해줘야하고 해당타입을 viewController의 T로 인식한다
typealias BaseViewController<T> = ViewController<T> & BindViewModelProtocol where T: BaseViewModel

// MARK: - viewModel관련해서 꼭 구현해야할 함수의 경우 여기서 구현해주면된다
protocol BindViewModelProtocol {
    func bindViewModel()
}

// MARK: - 기존의 baseViewController에서 viewModel또한 baseViewModel이 존재한다는 가정하에 baseViewModel를 상속받은 ViewModel
class ViewController<T>: UIViewController {
    
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
        view.backgroundColor = .red
        setUI()
        setConstraints()
    }
    
    func setUI() {}
    func setConstraints() {}
}
