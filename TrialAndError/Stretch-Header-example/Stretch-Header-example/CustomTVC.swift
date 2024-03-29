//
//  CustomTVC.swift
//  Stretch-Header-example
//
//  Created by ikbum on 2023/05/10.
//

import UIKit

class CustomTVC: UITableViewCell {
    static let identifier: String = "CustomTVC"

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.setLayout()
        self.skeletonAnimate()
    }
    
    private func setLayout() {
        self.addSubview(label)
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(30)
        }
    }
    
    private func skeletonAnimate() {
        /**
         Skeleton Animation 구현부
         */
    }
    
    private func bindText() {
        self.label.text = "안녕하세요!"
        self.label.backgroundColor = .clear
    }
    
    private let label = UILabel().then {
        $0.textColor = .blue
    }
    
}
