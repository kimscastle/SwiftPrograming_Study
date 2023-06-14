//
//  CollectionViewCellReuseProtocol.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit.UICollectionView

import SnapKit

protocol CollectionViewCellReuseProtocol: BaseCollectionViewCell {
    static var cellIdentifier: String { get }
    static func register(collectionView: UICollectionView)
    static func dequeueReuseCell(collectionView: UICollectionView, indexPath: IndexPath, input: T) -> Self
}


extension CollectionViewCellReuseProtocol {
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    static func register(collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: self.cellIdentifier)
    }
    
    static func dequeueReuseCell(collectionView: UICollectionView, indexPath: IndexPath, input: T) -> Self {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? Self else { fatalError("\(self.cellIdentifier)") }
        cell.dataBind(input: input)
        return cell
    }
}

protocol BaseCollectionViewCell where Self: UICollectionViewCell {
    associatedtype T
    func dataBind(input: T)
}

