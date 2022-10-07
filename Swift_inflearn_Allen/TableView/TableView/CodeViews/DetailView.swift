//
//  DetailView.swift
//  TableView
//
//  Created by uiskim on 2022/10/07.
//

import UIKit

class DetailView: UIView {
    
    lazy var stackView: UIStackView = {
        let v = UIStackView()
        v.addArrangedSubview(movieImage)
        v.addArrangedSubview(movieNameLabel)
        v.addArrangedSubview(descriptionLabel)
        v.spacing = 15
        v.axis = .vertical
        v.alignment = .fill
        addSubview(v)
        return v
    }()
    
    var movieImage: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    var movieNameLabel: UILabel = {
        let v = UILabel()
        v.font = .boldSystemFont(ofSize: 22)
        return v
    }()
    
    var descriptionLabel: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 17)
        v.numberOfLines = 2
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        movieImage.snp.makeConstraints { make in
            make.size.equalTo(240)
        }
        
        movieNameLabel.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
    }
    
}
