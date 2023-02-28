//
//  extenstions.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

import SnapKit

extension ConstraintMaker {
    func inner(view: UIView, length: CGFloat) {
        self.top.equalTo(view.snp.top).offset(-length)
        self.leading.equalTo(view.snp.leading).offset(-length)
        self.bottom.equalTo(view.snp.bottom).offset(length)
        self.trailing.equalTo(view.snp.trailing).offset(length)
    }
}

extension UIButton {
    func customButton(title: String, color: UIColor) {
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = color
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 10, weight: .bold)
    }
}
