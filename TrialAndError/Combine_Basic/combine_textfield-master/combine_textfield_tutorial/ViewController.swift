//
//  ViewController.swift
//  combine_textfield_tutorial
//
//  Created by Jeff Jeong on 2020/10/13.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var passwordConfirmTextField: UITextField!
    @IBOutlet var myBtn: UIButton!
    
    var viewModel : MyViewModel!
    
    private var mySubscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel = MyViewModel()
        
        passwordTextField
            .myTextPublisher
            // 이벤트를 방출해서
            .print()
            .receive(on: DispatchQueue.main)
            // 구독가능한녀석 @published에게 이벤트를 보내준다
            .assign(to: \.passwordInput, on: viewModel)
            .store(in: &mySubscriptions)
        
        passwordConfirmTextField
            .myTextPublisher
            // 이벤트를 방출해서
            .print()
            .receive(on: DispatchQueue.main)
            // 구독가능한녀석 @published에게 이벤트를 보내준다
            .assign(to: \.passwordComfirmInput, on: viewModel)
            .store(in: &mySubscriptions)
        
        // MARK: - 버튼이 뷰모델의 프로퍼티를 구독
        viewModel.isMatchPasswordInput
            .print()
            .receive(on: RunLoop.main)
            // 이벤트를 어디다가 보내줄래????
            .assign(to: \.isVaild, on: myBtn)
            .store(in: &mySubscriptions)
    }
}

extension UITextField {
    // MARK: - 이벤트를 방출할 수 있는 변수
    var myTextPublisher: AnyPublisher<String, Never> {
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            .print()
            .eraseToAnyPublisher()
    }
}

extension UIButton {
    var isVaild: Bool {
        get {
            backgroundColor == .yellow
        }
        set {
            backgroundColor = (newValue ? .yellow : .lightGray)
            isEnabled = newValue
            setTitleColor(newValue ? .blue : .white, for: .normal)
        }
    }
}
