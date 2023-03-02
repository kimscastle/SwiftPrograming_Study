//
//  ChatTextView.swift
//  ChatBubble
//
//  Created by uiskim on 2023/03/02.
//

import UIKit

import SnapKit
import Then

protocol MessageDelegate: AnyObject {
    func sendMessage(message: ChatModel)
}

class ChatTextView: UIView {
    
    weak var delegate: MessageDelegate?
    
    lazy var chatTextView: UITextView = UITextView().then {
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    lazy var sendButton: UIButton = UIButton().then {
        $0.customButton(title: "Go", color: .black)
        $0.isHidden = true
        $0.addTarget(self, action: #selector(sendButtonTapped(_:)), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped(_ sender: Any) {
        self.delegate?.sendMessage(message: .init(content: chatTextView.text, date: "3월2일", send: true))
        chatTextView.text = ""
        sendButton.isHidden = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setTextView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.addSubview(chatTextView)
        chatTextView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().inset(100)
            make.bottom.equalToSuperview().inset(10)
        }
        
        self.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.leading.equalTo(chatTextView.snp.trailing).offset(10)
            make.height.equalTo(30)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalTo(chatTextView.snp.bottom)
        }
    }
    
    private func setTextView() {
        chatTextView.isScrollEnabled = false
        chatTextView.sizeToFit()
    }
}
