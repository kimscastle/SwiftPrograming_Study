//
//  ThumbnailTableViewCell.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit

final class ThumbnailTableViewCell: UITableViewCell {

    static let identifier = "ThumbnailTableViewCell"

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "thumbnail")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let bookMarkButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "bookmark")
        button.configuration = config
        return button
    }()

    private let articleInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        return label
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func setLayout() {
        contentView.addSubview(backgroundImageView)
        [bookMarkButton, articleInfoLabel, titleLabel].forEach {
            backgroundImageView.addSubview($0)
        }

        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bookMarkButton.snp.makeConstraints { make in
            make.size.equalTo(48)
            make.top.trailing.equalToSuperview()
        }

        articleInfoLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(articleInfoLabel.snp.bottom).offset(12)
            make.leading.equalTo(articleInfoLabel)
            make.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(36)
        }
    }

    func configCell(_ header: Header) {
        titleLabel.text = header.title
        articleInfoLabel.text = "\(header.uploadDate) ﹒ \(header.writer)"
    }

}
