//
//  Extensions.swift
//  NotificationCenterProject
//
//  Created by uiskim on 2023/02/24.
//

import UIKit
import SnapKit

extension UIButton {
    func makeCustomButton(title: String, cornerRadius: CGFloat, fontSize: CGFloat) {
        self.setTitle(title, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = .systemFont(ofSize: fontSize, weight: .bold)
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
    }
}

extension ConstraintMaker {
    func rectSize(width: CGFloat, height: CGFloat) {
        self.width.equalTo(width)
        self.height.equalTo(height)
    }
}
