//
//  ViewController.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/27.
//

import UIKit

final class ViewController: BaseVC<ViewModel> {
    
    private var chatTableView = UITableView()
    
    private lazy var appendMyChatButton: UIButton = UIButton().then {
        $0.customButton(title: "나의 채팅 추가하기", color: .blue)
        $0.addTarget(self, action: #selector(appendMyChatButtonTapped), for: .touchUpInside)
    }
    
    private lazy var appendOtherChatButton: UIButton = UIButton().then {
        $0.customButton(title: "상대방 채팅 추가하기", color: .red)
        $0.addTarget(self, action: #selector(appendOtherChatButtonTapped), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setTableView()
    }
    
    private func setTableView() {
        chatTableView.dataSource = self
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorStyle = .none
        ChatTableViewCell.register(tableView: chatTableView)
        
        
    }
    
    override func setUI() {
        view.addSubview(chatTableView)
        view.addSubview(appendMyChatButton)
        view.addSubview(appendOtherChatButton)
    }
    
    override func configureUI() {
        chatTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        appendMyChatButton.snp.makeConstraints { make in
            make.top.equalTo(chatTableView.snp.bottom)
            make.leading.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        appendOtherChatButton.snp.makeConstraints { make in
            make.top.equalTo(chatTableView.snp.bottom)
            make.trailing.equalToSuperview().inset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatTableViewCell.dequeueResuableCell(tableView: chatTableView)
        cell.chat = viewModel.getData()[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

extension ViewController {
    @objc func appendMyChatButtonTapped() {
        viewModel.addData(ChatModel.basicChat)
        scrollToButton()
    }
    
    @objc func appendOtherChatButtonTapped() {
        viewModel.addData(.init(content: "상대방님의 메세지입니다", date: "22년2월29일", send: false))
        scrollToButton()
    }
    
    private func scrollToButton() {
        chatTableView.reloadData()
        chatTableView.scrollToRow(at: IndexPath(row: viewModel.getData().count-1, section: 0), at: .bottom, animated: true)
    }
}
