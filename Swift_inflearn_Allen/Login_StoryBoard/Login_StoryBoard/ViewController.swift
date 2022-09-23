//
//  ViewController.swift
//  Login_StoryBoard
//
//  Created by uiskim on 2022/09/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    func render() {
        view.backgroundColor = .gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        // textField의 borderStyle은 .roundRect가 default
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
    }


    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
}

