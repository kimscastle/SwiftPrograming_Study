//
//  UIProgressView+.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/21.
//

import UIKit

extension UIProgressView {
    func makeCustomProgress(cornerRadius: Double, progress: Float) {
        self.tintColor = .blue
        self.backgroundColor = .systemGray
        self.progress = progress
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
}
