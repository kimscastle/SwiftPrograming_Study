//
//  UICollectionViewLayout+.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//

import UIKit.UICollectionViewLayout

extension UICollectionViewLayout {
    static var makeCaruselFlowLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: Metric.cellWidth, height: Metric.collectionViewHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        return layout
    }
}
