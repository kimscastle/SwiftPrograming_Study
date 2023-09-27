//
//  MovieTableViewCell.swift
//  InfinityScroll
//
//  Created by uiskim on 2023/09/26.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var data: MovieAppData? {
        didSet {
            guard let data else { return }
            titleLabel.text = data.title
            releaseDateLabel.text = data.data
        }
    }
    
    static let cellId = "MovieTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .black
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.addSubview(titleLabel)
        contentView.addSubview(releaseDateLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(10)
        }
        
        releaseDateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
