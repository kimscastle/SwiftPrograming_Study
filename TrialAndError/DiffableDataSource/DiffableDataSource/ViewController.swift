//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var people: [Person] = [
        .init(name: "김의성", age: 27, address: "경기도 남양주시"),
        .init(name: "김유스", age: 26, address: "경상북도 포항시"),
        .init(name: "김찰리", age: 25, address: "경상남도 부산시")
    ]
    
    private let tableView = UITableView()
    
    private lazy var appendPersonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가하기", for: .normal)
        button.addTarget(self, action: #selector(appendPersonButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableView()
    }
    
    private func setUI() {
        view.addSubview(appendPersonButton)
        appendPersonButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 70
        tableView.dataSource = self
        DiffableTableViewCell.register(tableView: tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func appendPersonButtonTapped() {
        people.append(Person(name: "추가됨", age: 111, address: "추가됨"))
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DiffableTableViewCell.reusableCell(tableView: tableView)
        cell.data = people[indexPath.row]
        return cell
    }
}

