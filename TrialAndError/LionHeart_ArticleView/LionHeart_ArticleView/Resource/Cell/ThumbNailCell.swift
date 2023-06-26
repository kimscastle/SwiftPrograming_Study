//
//  ThumbNailCell.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit

class ThumbNailCell: UITableViewCell {
    
    static let identifier = "ThumbNailCell"
    
    var input: UIImage? {
        didSet {
            guard let input else { return }
            thumbNail.image = input
        }
    }
    
    private var thumbNail: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(thumbNail)
        thumbNail.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
