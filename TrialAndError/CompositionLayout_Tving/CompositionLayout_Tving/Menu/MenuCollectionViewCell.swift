//
//  MenuCollectionViewCell.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static var cellId = "MenuCollectionViewCell"
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .light)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.font = .systemFont(ofSize: 17, weight: isSelected ? .bold : .light)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
