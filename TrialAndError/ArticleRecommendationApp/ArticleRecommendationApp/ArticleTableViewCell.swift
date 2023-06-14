//
//  ArticleTableViewCell.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit

protocol ArticleLikeDelegate: AnyObject {
    func changeArticleLike(sender: UIButton, isLike: Bool)
}

final class ArticleTableViewCell: UITableViewCell, TableViewCellReuseProtocol {
    
    weak var delegate: ArticleLikeDelegate?
    
    private let contentName: UILabel = {
        let label = UILabel()
        label.textColor = .red
        return label
    }()
    
    private let isLike: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    typealias T = Article

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(contentName)
        contentView.addSubview(isLike)
        isLike.setContentHuggingPriority(.init(252), for: .horizontal)
        contentName.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalTo(isLike.snp.leading).offset(20)
        }
        
        isLike.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(30)
        }
        
        isLike.addTarget(self, action: #selector(isLikeButtonTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(input: Article) {
        contentName.text = input.articelName
        isLike.setImage(UIImage(systemName: input.articelLike ? "heart.fill" : "heart"), for: .normal)
        isLike.isSelected = input.articelLike
    }
    
    @objc func isLikeButtonTapped(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        isLike.setImage(UIImage(systemName: sender.isSelected ? "heart.fill" : "heart"), for: .normal)
        delegate?.changeArticleLike(sender: sender, isLike: sender.isSelected)
    }
}


