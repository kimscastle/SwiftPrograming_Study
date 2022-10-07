//
//  CodeMainTableViewCell.swift
//  TableView
//
//  Created by uiskim on 2022/10/07.
//

import UIKit

class CodeMainTableViewCell: UITableViewCell {
    
    //MARK : - veiwdidload가 없어 이런방식은 불가능
    //var data: Movie?
    
    lazy var mainImage: UIImageView = {
        let v = UIImageView()
        addSubview(v)
        return v
    }()
    
    var movieNameLabel: UILabel = {
        let v = UILabel()
        v.font = .boldSystemFont(ofSize: 17)
        return v
    }()
    
    var descriptionLabel: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 17)
        v.numberOfLines = 2
        return v
    }()
    
    lazy var stackView: UIStackView = {
        let v = UIStackView()
        v.addArrangedSubview(movieNameLabel)
        v.addArrangedSubview(descriptionLabel)
        v.axis = .vertical
        v.spacing = 8
        v.alignment = .fill
        v.distribution = .fill
        addSubview(v)
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        mainImage.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp_topMargin)
            make.bottom.equalTo(mainImage.snp_bottomMargin)
            make.left.equalTo(mainImage.snp_rightMargin).offset(30)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    func setData(_ movie: Movie) {
        mainImage.image = movie.movieImage
        movieNameLabel.text = movie.movieName
        descriptionLabel.text = movie.movieDescription
    }
    
}
