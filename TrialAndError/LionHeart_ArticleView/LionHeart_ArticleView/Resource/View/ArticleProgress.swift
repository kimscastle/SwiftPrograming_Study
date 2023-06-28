//
//  ArticleProgress.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/27.
//

import UIKit

final class ArticleProgress: UIProgressView {
    
    init() {
        super.init(frame: .zero)
        self.progressViewStyle = .bar
        self.trackTintColor = .lightGray
        self.progressTintColor = .black
        self.transform = CGAffineTransform(scaleX: 1, y: 2)
        self.progress = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
