//
//  BlockCell.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit

class BlockCell: UITableViewCell {
    
    static let identifier = "BlockCell"
    
    var input: String? {
        didSet {
            blockContent.text = input
        }
    }
    
    private var bulb: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "lightbulb"))
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .yellow
        return imageView
    }()
    
    private var block: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let blockContent: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
