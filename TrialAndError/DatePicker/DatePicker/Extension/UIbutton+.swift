//
//  UIbutton+.swift
//  DatePicker
//
//  Created by uiskim on 2023/02/02.
//

import UIKit

extension UIButton {
    func setButtonSetting(title: String, textColor: UIColor, fontSize: CGFloat, fontWeight: UIFont.Weight) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    }
}
