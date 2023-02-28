//
//  ChatModel.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

struct ChatModel {
    let content: String
    let date: String
    let send: Bool
    
    static let basicChat = ChatModel(content: "추가된 메세지입니다", date: "22년2월29일", send: true)
}
