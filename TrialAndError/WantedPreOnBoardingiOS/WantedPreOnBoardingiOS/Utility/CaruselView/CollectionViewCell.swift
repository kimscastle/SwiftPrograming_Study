//
//  CollectionViewCell.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    var item: TvingPoster? {
        didSet {
            guard let item else { return }
            someView.image = item.posterImage
            titleLabel.text = item.title
            contentLabel.text = item.content
        }
    }
    
    // MARK: UI
    private let someView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .white
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    
    
    // MARK: Initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(someView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentLabel)
        
        NSLayoutConstraint.activate([
            someView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            someView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            someView.topAnchor.constraint(equalTo: contentView.topAnchor),
            someView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 140).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        someView.image = nil
    }
}
