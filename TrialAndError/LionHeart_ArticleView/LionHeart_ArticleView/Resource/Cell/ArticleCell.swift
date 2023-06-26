//
//  ArticleCell.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/27.
//

import UIKit

protocol ArticleViewProtocol: ContentCellLayoutProtocol,
                              QuoteCellLayoutProtocol,
                              TitleCellLayoutProtocol,
                              ThumbNailLayoutProtocol,
                              BlockLayoutProtocol {}

protocol ContentCellLayoutProtocol {
    func setContentCell(content: String)
}

protocol QuoteCellLayoutProtocol {
    func setQuoteCell(content: String)
}

protocol TitleCellLayoutProtocol {
    func setTitleCell(content: Header)
}

protocol ThumbNailLayoutProtocol {
    func setThumbNailCell(content: UIImage)
}

protocol BlockLayoutProtocol {
    func setBlockCell(content: String)
}

class ArticleCell: UITableViewCell, ArticleViewProtocol {
    
    static let identifier = "ArticleCell"
    
    var input: ArticleContentType? {
        didSet {
            guard let input else { return }
            switch input {
            case .thumbNail(let uIImage):
                setThumbNailCell(content: uIImage)
            case .title(let header):
                setTitleCell(content: header)
            case .quote(let string):
                setQuoteCell(content: string)
            case .content(let string):
                setContentCell(content: string)
            case .block(let string):
                setBlockCell(content: string)
            }
        }
    }
    
    func setContentCell(content: String) {
        let articleContent: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.textColor = .black
            label.textAlignment = .left
            label.text = content
            label.numberOfLines = 0
            return label
        }()
        
        self.addSubview(articleContent)
        articleContent.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    func setQuoteCell(content: String) {
        let quoteLine: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            return view
        }()
        
        let quoteContent: UILabel = {
            let label = UILabel()
            label.font = .boldSystemFont(ofSize: 16)
            label.textColor = .black
            label.textAlignment = .left
            label.text = content
            label.numberOfLines = 0
            return label
        }()
        
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
    
    func setTitleCell(content: Header) {
        let title: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.textAlignment = .left
            label.font = .boldSystemFont(ofSize: 28)
            label.text = content.title
            label.numberOfLines = 0
            return label
        }()
        
        let uploadDate: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 12)
            label.text = content.uploadDate
            return label
        }()
        
        let publisher: UILabel = {
            let label = UILabel()
            label.textColor = .black
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 12)
            label.text = content.publisher
            return label
        }()
        
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
    
    func setThumbNailCell(content: UIImage) {
        var thumbNail: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = content
            return imageView
        }()
        
        self.addSubview(thumbNail)
        thumbNail.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setBlockCell(content: String) {
        var bulb: UIImageView = {
            let imageView = UIImageView(image: UIImage(systemName: "lightbulb"))
            imageView.contentMode = .scaleAspectFill
            imageView.tintColor = .yellow
            return imageView
        }()
        
        var block: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            return view
        }()
        
        let blockContent: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.textColor = .white
            label.textAlignment = .left
            label.numberOfLines = 0
            return label
        }()
        
        self.addSubview(block)
        block.addSubview(bulb)
        block.addSubview(blockContent)
        block.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        bulb.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.size.equalTo(20)
        }
        
        blockContent.snp.makeConstraints { make in
            make.leading.equalTo(bulb.snp.trailing).offset(20)
            make.top.bottom.trailing.equalToSuperview().inset(10)
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
