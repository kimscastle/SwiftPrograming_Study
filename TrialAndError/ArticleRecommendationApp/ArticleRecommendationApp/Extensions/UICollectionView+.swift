//
//  UICollectionView+.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit
import SnapKit
 
 
extension UICollectionView {
    
    func setEmptyView(title: String, message: String) {
        let emptyView: UIView = {
            let view = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.width, height: self.bounds.height))
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 15)
            return label
        }()
        
        let messageLabel: UILabel = {
            let label = UILabel()
            label.text = message
            label.textColor = .gray
            label.font = .systemFont(ofSize: 12, weight: .light)
            label.numberOfLines = 0
            label.textAlignment = .center
            return label
        }()
        
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(emptyView.snp.centerY)
            $0.centerX.equalTo(emptyView.snp.centerX)
        }
        
        messageLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.left.equalTo(emptyView.snp.left).offset(20)
            $0.right.equalTo(emptyView.snp.right).offset(-20)
        }
        
        self.backgroundView = emptyView
        
    }
    
    func restore() {
        self.backgroundView = nil
    }
}
