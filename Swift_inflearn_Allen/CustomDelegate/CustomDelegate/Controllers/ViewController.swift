//
//  ViewController.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/06.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setNavigation()
        setUpTableview()
        setData()
    }
    
    func setUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setNavigation() {
        title = "프로필"
        let appearnce = UINavigationBarAppearance()
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        appearnce.backgroundColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = appearnce
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setUpTableview() {
        tableView.rowHeight = 100
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberTableViewCell")
    }
    
    func setData() {
        memberListManager.makeMemberListData()
    }
    
    @objc func plusButtonTapped() {
        print("추가하기 버튼이 눌렸습니다")
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        cell.member = memberListManager[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

