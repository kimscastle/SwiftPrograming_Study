//
//  String+.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

extension String {
    func calcuateWidth(addPadding: CGFloat) -> CGFloat {
        let label = UILabel()
        label.text = self
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.sizeToFit()
        return label.frame.width + addPadding
    }
}
