//
//  ViewController.swift
//  Part10_Login
//
//  Created by uiskim on 2023/03/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    
    var emailErrorHeight: NSLayoutConstraint!
    var passwordErrorHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield값이 변경되는걸 캐치하는게 없음
        emailTextField.addTarget(self, action: #selector(textFieldEdited(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited(_:)), for: .editingChanged)
        
        emailErrorHeight = emailError.heightAnchor.constraint(equalToConstant: 0)
        passwordErrorHeight = passwordError.heightAnchor.constraint(equalToConstant: 0)
    }

    @objc func textFieldEdited(_ textField: UITextField) {
        if textField == emailTextField {
            guard let emailText = textField.text else { return }
            emailErrorHeight.isActive = checkEmail(str: emailText) ? true : false
        } else if textField == passwordTextField {
            guard let passwordText = textField.text else { return }
            passwordErrorHeight.isActive = checkPassword(str: passwordText) ? true : false
        }
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    // 정규식 - regular expression
    func checkEmail(str: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: str)
    }
    
    func checkPassword(str: String) -> Bool {
        guard str.count > 8 else { return false }
        return true
    }

}



