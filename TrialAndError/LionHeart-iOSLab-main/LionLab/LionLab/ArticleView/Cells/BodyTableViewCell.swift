//
//  BodyTableViewCell.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit

final class BodyTableViewCell: UITableViewCell {

    static let identifier = "BodyTableViewCell"

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)

        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        contentView.addSubview(bodyLabel)

        bodyLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(22)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }

    func configCell(_ str: String) {
        bodyLabel.text = str
    }

}
