//
//  UIScrollView+.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//
import UIKit.UIScrollView

extension UIScrollView {
    func move(to: Double, animation: Bool = false) {
        self.setContentOffset(.init(x: to, y: self.contentOffset.y), animated: animation)
    }
}
