//
//  CustomKeyboard.swift
//  Part3_CustomKeyboard
//
//  Created by uiskim on 2023/03/21.
//

import UIKit

// custom delegate
protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
    }
}
