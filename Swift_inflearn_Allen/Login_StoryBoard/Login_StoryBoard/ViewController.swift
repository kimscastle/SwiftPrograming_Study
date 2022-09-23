//
//  ViewController.swift
//  Login_StoryBoard
//
//  Created by uiskim on 2022/09/23.
//

import UIKit

class ViewController: UIViewController {

    // textfield는 단순히 글자를입력만하는 역할을한다
    // 글자를입력하는 역할이외의 모든 action을 대신해줄게 필요하고 그걸 viewcontroller가 해줌
    @IBOutlet weak var textField: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        render()
    }
    
    func render() {
        view.backgroundColor = .gray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        // textField의 borderStyle은 .roundRect가 default
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        // 키보드의 가장 오른쪽 아래버튼을 어떤버튼으로 보이게할지
        textField.returnKeyType = .done
    }


    @IBAction func doneButtonTapped(_ sender: UIButton) {
        
    }
}

extension ViewController: UITextFieldDelegate {
    // 텍스트필드의 입력을 시작할 때 호출(시작할지 말지 여부를 허락하는 메서드)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // clear를 허락할지 말지 (false면 x버튼을 눌러도 clear가 되지 않음)
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 참과거짓이 return이 아닌 함수는 시점에 대한 메서드임
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("유저가 텍스트필드의 입력을 시작했다.")
    }
    
    // 자주사용하게됨 - 글자 한글자한글자 입력하고 지워질때 호출이되고 (허락까지)
    // 한글자한글자에 조건을 달 수 있다
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
    
    // 텍스트필드의 엔터키를 누르면 다음동작을 허락할것인지 말것인지
    // 예를들어 엔터키를 누르면 다음 텍스트필드로 커서를 옮길수있게
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        } else {
            return true
        }
    }
    
    // 텍스트필드의 입력이 끝날때 호출(끝낼수있게 만들지 return버튼을 사용할수있게만들지)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트필드의 입력이 끝날때 호출(return을 누르면 어떤 action을 할지)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("유저가 텍스트필드의 입력을 끝냈다.")
    }
}

