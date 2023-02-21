//
//  UIButton+.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/21.
//

import UIKit

extension UIButton {
    func createCustomButton(title: String, cornerRadius: CGFloat) {
        self.setTitle(title, for: .normal)
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
    }
}
