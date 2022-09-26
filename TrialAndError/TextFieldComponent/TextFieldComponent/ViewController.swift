//
//  ViewController.swift
//  TextFieldComponent
//
//  Created by uiskim on 2022/09/25.
//

import UIKit

class ViewController: UIViewController {
    
    let textFieldComponent1: LimitTextField = {
        let v = LimitTextField(frame: .zero, type: .holder)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let textFieldComponent2: LimitTextField = {
        let v = LimitTextField(frame: .zero, type: .roomName)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    func render() {
        view.addSubview(textFieldComponent1)
        textFieldComponent1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        textFieldComponent1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldComponent1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textFieldComponent1.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.addSubview(textFieldComponent2)
        textFieldComponent2.topAnchor.constraint(equalTo: textFieldComponent1.bottomAnchor).isActive = true
        textFieldComponent2.leadingAnchor.constraint(equalTo: textFieldComponent1.leadingAnchor).isActive = true
        textFieldComponent2.trailingAnchor.constraint(equalTo: textFieldComponent1.trailingAnchor).isActive = true
        textFieldComponent2.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

