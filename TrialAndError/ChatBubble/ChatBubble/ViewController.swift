//
//  ViewController.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/27.
//

import UIKit

final class ViewController: BaseVC<ViewModel> {
    
    private var chatTableView = UITableView()
    
    private lazy var appendChatButton: UIButton = UIButton().then {
        $0.customButton(title: "채팅 추가하기")
        $0.addTarget(self, action: #selector(appendChatButtonTapped), for: .touchUpInside)
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
        view.addSubview(appendChatButton)
    }
    
    override func configureUI() {
        chatTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        appendChatButton.snp.makeConstraints { make in
            make.top.equalTo(chatTableView.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(100)
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
    @objc func appendChatButtonTapped() {
        viewModel.addData(ChatModel.basicChat)
        chatTableView.reloadData()
    }
}
