//
//  ViewController.swift
//  Part3_CustomKeyboard
//
//  Created by uiskim on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 커스텀 키보드 설정 방법
        // firstTextField.inputView = "커스텀 키보드 뷰"

        // xib파일을 불러오는 방법(외워야함)
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        
        // CustomKeyboard라는 파일에 여러개의 요소가 list형태로 들어가있음
        // loadNib는 [Any]형태이기 때문에 사용하려면 다운캐스팅 해줘야함
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        firstTextField.inputView = myKeyboardView
    }
}

extension ViewController: CustomKeyboardDelegate {
    func keyboardTapped(str: String) {
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)) {
                // Int to String이 아니라 Int? to String이기 때문에 describing사용해야함...?
                firstTextField.text = String(formatted)
            }
        }
    }
}

