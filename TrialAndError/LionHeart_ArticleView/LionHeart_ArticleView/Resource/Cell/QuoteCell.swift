//
//  QuoteCell.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit

class QuoteCell: UITableViewCell {
    
    static let identifier = "QuoteCell"
    
    var input: String? {
        didSet {
            quoteContent.text = input
        }
    }
    
    private let quoteLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let quoteContent: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(quoteLine)
        self.addSubview(quoteContent)
        quoteLine.snp.makeConstraints { make in
            make.width.equalTo(3)
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.equalToSuperview().inset(20)
        }
        
        quoteContent.snp.makeConstraints { make in
            make.leading.equalTo(quoteLine.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(10)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
