//
//  Extensions.swift
//  UberApp_CloneCoding
//
//  Created by uiskim on 2023/03/03.
//

import UIKit
import SnapKit

extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) {
        self.borderStyle = .none
        self.font = .systemFont(ofSize: 16)
        self.textColor = .white
        self.keyboardAppearance = .dark
        self.isSecureTextEntry = isSecureTextEntry
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
}

extension UIView {
    func inputContainerView(image: UIImage, textfield: UITextField) {
        let emailImageView: UIImageView = UIImageView().then {
            $0.image = image
            $0.alpha = 0.87
        }
        
        let seperatorView: UIView = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        self.addSubview(emailImageView)
        emailImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(8)
            make.size.equalTo(24)
        }
        
        self.addSubview(textfield)
        textfield.snp.makeConstraints { make in
            make.leading.equalTo(emailImageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(seperatorView)
        seperatorView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(0.75)
        }
    }
}
