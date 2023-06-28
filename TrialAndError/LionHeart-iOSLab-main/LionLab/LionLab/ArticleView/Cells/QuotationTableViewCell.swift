//
//  CalloutTableViewCell.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit

final class QuotationTableViewCell: UITableViewCell {
    static let identifier = "QuotationTableViewCell"

    private let quoteLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private let bodyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
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
        contentView.addSubview(quoteLine)
        contentView.addSubview(bodyLabel)

        quoteLine.snp.makeConstraints { make in
            make.width.equalTo(4)
            make.leading.equalToSuperview().inset(22)
            make.top.bottom.equalToSuperview().inset(20)
        }

        bodyLabel.snp.makeConstraints { make in
            make.leading.equalTo(quoteLine.snp.trailing).offset(22)
            make.trailing.equalToSuperview().inset(22)
            make.top.bottom.equalToSuperview().inset(20)
        }
    }

    func configCell(_ str: String) {
        bodyLabel.text = str
    }

}
