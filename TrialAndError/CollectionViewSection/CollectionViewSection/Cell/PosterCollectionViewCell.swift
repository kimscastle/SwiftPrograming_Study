//
//  PosterCollectionViewCell.swift
//  CollectionViewSection
//
//  Created by uiskim on 2023/06/20.
//

import UIKit

import SnapKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    var poster: UIImage? {
        didSet {
            posterView.image = poster
        }
    }
    
    static var cellID: String = "PosterCollectionViewCell"
    
    private let posterView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterView)
        posterView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
