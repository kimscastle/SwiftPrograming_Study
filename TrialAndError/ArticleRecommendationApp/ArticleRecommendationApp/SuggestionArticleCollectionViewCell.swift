//
//  SuggestionArticleCollectionViewCell.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit

import SnapKit

final class SuggestionArticleCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {

    private let suggestionArticleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .black
        layer.cornerRadius = 10
        clipsToBounds = false
        contentView.addSubview(suggestionArticleLabel)
        suggestionArticleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func dataBind(input: String) {
        suggestionArticleLabel.text = input
    }
    
}
