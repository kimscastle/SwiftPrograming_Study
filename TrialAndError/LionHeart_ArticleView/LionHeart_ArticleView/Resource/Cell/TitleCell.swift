//
//  TitleCell.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit

class TitleCell: UITableViewCell {
    
    static let identifier = "TitleCell"
    
    var input: Header? {
        didSet {
            guard let input else { return }
            title.text = input.title
            uploadDate.text = input.uploadDate
            publisher.text = input.publisher
        }
    }
    
    private let title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 28)
        label.numberOfLines = 0
        return label
    }()
    
    private let uploadDate: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private let publisher: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(title)
        self.addSubview(uploadDate)
        self.addSubview(publisher)
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        uploadDate.setContentHuggingPriority(.init(252), for: .horizontal)
        uploadDate.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
        
        publisher.snp.makeConstraints { make in
            make.top.equalTo(uploadDate.snp.top)
            make.bottom.equalTo(uploadDate.snp.bottom)
            make.leading.equalTo(uploadDate.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
