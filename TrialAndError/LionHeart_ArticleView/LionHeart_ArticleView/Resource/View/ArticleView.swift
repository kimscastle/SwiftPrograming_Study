//
//  ArticleView.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/27.
//

import UIKit

final class ArticleView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.separatorStyle = .none
        self.rowHeight = UITableView.automaticDimension
        self.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        self.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.identifier)
        self.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        self.register(ThumbNailCell.self, forCellReuseIdentifier: ThumbNailCell.identifier)
        self.register(BlockCell.self, forCellReuseIdentifier: BlockCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

