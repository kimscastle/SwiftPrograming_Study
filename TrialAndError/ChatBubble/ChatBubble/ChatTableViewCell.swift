//
//  ChatTableViewCell.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

class ChatTableViewCell: UITableViewCell, ReuseCellProtocol {
    
    var chat: ChatModel? {
        didSet {
            guard let data = chat else { return }
            content.text = data.content
            dataLabel.text = data.date
            bubbleImage.image = UIImage(named: data.send ? ImageConstant.bubbleImageYellow : ImageConstant.bubbleImageGray)
            data.send ? setMySend() : setOtherSend()
        }
    }
    
    private var bubbleImage: UIImageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    private var content: UILabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .bold)
        $0.textColor = .black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    
    private var dataLabel: UILabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .black
        $0.textAlignment = .left
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(bubbleImage)
        contentView.addSubview(content)
        contentView.addSubview(dataLabel)
        bubbleImage.snp.makeConstraints { make in
            make.inner(view: content, length: 20)
        }
    }
    
    private func setMySend() {
        content.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
            make.leading.greaterThanOrEqualToSuperview().inset(200)
            make.top.bottom.equalToSuperview().inset(30)
        }
        dataLabel.snp.remakeConstraints { make in
            make.trailing.equalTo(bubbleImage.snp.leading).offset(-10)
            make.bottom.equalTo(bubbleImage.snp.bottom)
        }
    }
    
    private func setOtherSend() {
        content.snp.remakeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(30)
            make.trailing.lessThanOrEqualToSuperview().inset(200)
            make.top.bottom.equalToSuperview().inset(30)
        }
        
        dataLabel.snp.remakeConstraints { make in
            make.leading.equalTo(bubbleImage.snp.trailing).offset(10)
            make.bottom.equalTo(bubbleImage.snp.bottom)
        }
    }
}
