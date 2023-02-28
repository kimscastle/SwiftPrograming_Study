//
//  ViewModel.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

class ViewModel: BaseViewModel {

    typealias T = ChatModel
    
    var chatMessages: [ChatModel] = []
    
    func fetchData() {
        chatMessages = [
            ChatModel(content: "안녕하세요", date: "22년2월28일", send: true),
            ChatModel(content: "네 안녕하세요 ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ반가워요ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ", date: "22년2월28일", send: false),
            ChatModel(content: "저는 김의성이라고 합니다 잘부탁드립니다", date: "22년2월28일", send: true),
            ChatModel(content: "안녕하세요\n 이야기는 많이들었습니다\n저는 김유스라고합니다\n앞으로잘부탁드립니다\nㅎㅎㅎㅎㅎㅎ", date: "22년2월28일", send: false)
        ]
    }
    
    func getData() -> [ChatModel] {
        return chatMessages
    }
    
    func addData(_ data: ChatModel) {
        chatMessages.append(data)
    }
    
    func deleteData(index: Int) {
        print("\(index)번째 index가 삭제되었습니다")
    }
    
}
