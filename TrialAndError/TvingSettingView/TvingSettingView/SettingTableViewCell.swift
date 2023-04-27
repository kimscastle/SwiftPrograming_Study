//
//  SettingTableViewCell.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

import SnapKit

class SettingTableViewCell: UITableViewCell {
    
    static let cellId = "SettingTableViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "gggggggggg"
        label.textColor = .white
        return label
    }()
    
    let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        backgroundColor = .black
        addSubview(label)
        addSubview(myImageView)
        label.snp.makeConstraints { make in
//            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        myImageView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.size.equalTo(20)
        }
        
    }

}
