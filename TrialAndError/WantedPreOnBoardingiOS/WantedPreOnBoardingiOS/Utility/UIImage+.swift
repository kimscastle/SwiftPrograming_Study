//
//  UIImage+.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit

extension UIImage {
    static func makeSFImage(imageString: String, size: CGFloat) -> UIImage? {
        return UIImage(systemName: imageString, withConfiguration: UIImage.SymbolConfiguration(pointSize: size))
    }
}


