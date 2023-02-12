//
//  Extensions.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/12.
//

import UIKit

extension UIView {
    func addsubViews(Views: UIView...) {
        Views.forEach { addSubview($0) }
    }
}
