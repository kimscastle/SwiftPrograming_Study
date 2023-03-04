//
//  Extensions.swift
//  UberApp_CloneCoding
//
//  Created by uiskim on 2023/03/03.
//

import UIKit
import SnapKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
    
    static let backgroundColor = UIColor.rgb(red: 25, green: 25, blue: 25)
    static let mainBlueTint = UIColor.rgb(red: 17, green: 154, blue: 237)
}

extension UITextField {
    func textField(withPlaceholder placeholder: String, isSecureTextEntry: Bool) {
        self.borderStyle = .none
        self.font = .systemFont(ofSize: 16)
        self.textColor = .white
        self.keyboardAppearance = .dark
        self.isSecureTextEntry = isSecureTextEntry
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
    }
}

extension UIView {
    func inputContainerView(image: UIImage, textfield: UITextField? = nil, segmentControl: UISegmentedControl? = nil) {
        let imageView: UIImageView = UIImageView().then {
            $0.image = image
            $0.alpha = 0.87
        }
        
        let seperatorView: UIView = UIView().then {
            $0.backgroundColor = .lightGray
        }
        
        self.addSubview(imageView)

        
        if let textfield = textfield {
            
            imageView.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
                make.leading.equalToSuperview().inset(8)
                make.size.equalTo(24)
            }
            self.addSubview(textfield)
            textfield.snp.makeConstraints { make in
                make.leading.equalTo(imageView.snp.trailing).offset(8)
                make.trailing.equalToSuperview()
                make.centerY.equalToSuperview()
            }
        }
        
        if let segmentControl = segmentControl {
            imageView.snp.makeConstraints { make in
                make.top.equalToSuperview().inset(-8)
                make.leading.equalToSuperview().inset(8)
                make.size.equalTo(24)
            }
            
            self.addSubview(segmentControl)
            segmentControl.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(8)
                make.centerY.equalToSuperview()
            }
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
