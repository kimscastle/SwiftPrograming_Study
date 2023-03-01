
//
//  ViewController.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/27.
//

import UIKit

final class ViewController: BaseVC<ViewModel> {
    
    private var chatTableView = UITableView()
    
    private lazy var chatTextView: UITextView = UITextView().then {
        $0.backgroundColor = .gray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.addKeyboardNotifications()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setTableView()
        setTextView()
        addTapGesture()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeKeyboardNotifications()
    }

    // MARK: - touchBegan의 경우에 tableView를 터치하면 안먹는다 그러므로 그냥 view가 tapGesture를 감지하도록 만들어서 selector로 이벤트를 전달해주는게 좋다
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    private func setTableView() {
        chatTableView.dataSource = self
        chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.separatorStyle = .none
        ChatTableViewCell.register(tableView: chatTableView)
        DispatchQueue.main.async { [self] in
            scrollToButton(animate: false)
        }
    }
    
    private func setTextView() {
        chatTextView.delegate = self
        chatTextView.isScrollEnabled = false
    }
    
    override func setUI() {
        view.addSubview(chatTableView)
        view.addSubview(chatTextView)
    }
    
    override func configureUI() {
        chatTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(chatTextView.snp.top).offset(-10)
        }

        chatTextView.snp.remakeConstraints { make in
            make.height.lessThanOrEqualTo(60)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
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
    @objc private func hideKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    private func scrollToButton(animate: Bool) {
        chatTableView.reloadData()
        chatTableView.scrollToRow(at: IndexPath(row: viewModel.getData().count-1, section: 0), at: .bottom, animated: animate)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.becomeFirstResponder()
        scrollToButton(animate: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let estimatedSize = textView.sizeThatFits(CGSize(width: textView.frame.width, height: 60.0))
        textView.isScrollEnabled = estimatedSize.height <= 60 ? false : true
    }
}

extension ViewController {
    func addKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 추가
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // 노티피케이션을 제거하는 메서드
    func removeKeyboardNotifications(){
        // 키보드가 나타날 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        // 키보드가 사라질 때 앱에게 알리는 메서드 제거
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
           let keyboardRectangle = keyboardFrame.cgRectValue
            UIView.animate(withDuration: 0.3, animations: {
                self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardRectangle.height)
            })
        }
    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.view.transform = .identity
    }
}
