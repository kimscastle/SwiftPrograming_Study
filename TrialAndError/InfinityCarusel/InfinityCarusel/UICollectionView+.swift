//
//  UICollectionView+.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//

import UIKit.UICollectionView

extension UICollectionView {
    func scroll(to item: Int, animation: Bool = false) {
        self.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: animation)
    }
}
