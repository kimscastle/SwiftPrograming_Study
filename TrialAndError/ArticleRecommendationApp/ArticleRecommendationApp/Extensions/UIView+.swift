//
//  UIView+.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit

extension UIView {
    func addsubViews(_ input: UIView...) {
        input.forEach { self.addSubview($0) }
    }
}
