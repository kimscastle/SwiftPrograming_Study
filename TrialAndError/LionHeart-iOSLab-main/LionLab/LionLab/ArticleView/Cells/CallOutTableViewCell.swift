//
//  QuotationTableViewCell.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit

final class CallOutTableViewCell: UITableViewCell {

    static let identifier = "CallOutTableViewCell"

    private let calloutView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 3
        return view
    }()

    private let iconImageView = UIImageView(
        image: UIImage(systemName: "lightbulb.fill")
    )

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
        contentView.addSubview(calloutView)
        calloutView.addSubview(iconImageView)
        calloutView.addSubview(bodyLabel)

        calloutView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.leading.trailing.equalToSuperview().inset(22)
        }

        iconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(14)
        }

        bodyLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView)
            make.leading.equalTo(iconImageView.snp.trailing).offset(4)
//            make.trailing.equalToSuperview().inset(10).priority(.low)
            make.bottom.equalToSuperview().inset(10)
        }
    }

    func configCell(_ str: String) {
        bodyLabel.text = str
    }



}
