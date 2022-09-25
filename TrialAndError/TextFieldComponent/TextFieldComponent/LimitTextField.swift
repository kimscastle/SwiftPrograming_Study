//
//  LimitTextField.swift
//  TextFieldComponent
//
//  Created by uiskim on 2022/09/25.
//

import UIKit

public enum textFieldType: Int {
    case nickName = 10    // 닉네임을 입력해주세요, limit : 10
    case holder = 20     // 예금주명을 입력해주세요, limit : 20
    case roomName = 12  // 정산방 이름을 입력하세요, limit : 12
    
    var placeHolder: String {
        switch self {
        case .nickName:
            return "닉네임을 입력해주세요"
        case .holder:
            return "예금주명을 입력해주세요"
        case .roomName:
            return "정산방 이름을 입력하세요"
        }
    }
}

class LimitTextField: UIView {

    private var type: textFieldType
    private var limit: Int = 0

    private let textField: UITextField = {
        let v = UITextField()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.borderStyle = .roundedRect
        v.clearButtonMode = .always
        return v
    }()
    
    private let line: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        v.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return v
    }()
    
    private let limitLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        v.tintColor = .black
        v.textAlignment = .right
        return v
    }()
    
    init(frame: CGRect, type: textFieldType) {
        self.type = type
        super.init(frame: frame)
        textField.delegate = self
        configureUI()
        render()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        textField.placeholder = type.placeHolder
        limit = type.rawValue
        limitLabel.text = "0/\(limit)"
    }
    
    func render() {
        addSubview(textField)
        addSubview(limitLabel)
        textField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        limitLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 5).isActive = true
        limitLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        limitLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        limitLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
}

extension LimitTextField: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= limit
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        limitLabel.text = "\(text.count)/\(limit)"
    }
}
