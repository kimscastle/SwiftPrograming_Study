//
//  RankingCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by uiskim on 2023/05/01.
//

import UIKit
import SnapKit
class RankingCollectionViewCell: UICollectionViewCell {
    static let cellId = "RankingCollectionViewCell"
    
    var data: VideoInfo? {
        didSet {
            guard let data = data else { return }
            posterView.image = data.image
            title.text = data.name
        }
    }
    
    let posterView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.clipsToBounds = true
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.text = "1등"
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textColor = .cyan
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        contentView.addSubview(posterView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        posterView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.top.equalTo(posterView.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(17)
        }
        
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(17)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
