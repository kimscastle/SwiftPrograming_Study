//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var viewModel = ViewModel()
    
    // 1.tableView 정의
    private let tableView = UITableView()
    
    // 2.DiffableDataSource정의 -> 기존의 DataSource와 Delegate를 대체
    var diffableDataSource: CustomDiffableDataSource!
    
    // 3.SnapShot정의
    var snapShot: NSDiffableDataSourceSnapshot<Section, Person>!
    
    private lazy var appendPersonButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가하기", for: .normal)
        button.addTarget(self, action: #selector(appendPersonButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPeople()
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
        DiffableTableViewCell.register(tableView: tableView)
        diffableDataSource = CustomDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = DiffableTableViewCell.reusableCell(tableView: tableView)
            cell.data = itemIdentifier
            return cell
        })
        
//        diffableDataSource.deletePerson = { index in
//            self.viewModel.deletePerson(index: index)
//        }
        diffableDataSource.delegate = self
        
        snapShot = NSDiffableDataSourceSnapshot()
        
        snapShot.appendSections([.main])
        
        snapShot.appendItems(viewModel.people, toSection: .main)
        
        diffableDataSource.apply(snapShot, animatingDifferences: true)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func appendPersonButtonTapped() {
        var snapshot = diffableDataSource.snapshot()
        let newPerson: Person = .init(name: "추가", age: Int.random(in: 0..<100), address: "추가")
        snapshot.appendItems([newPerson], toSection: .main)
        viewModel.people.append(newPerson)
        diffableDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ViewController: CustomDiffableDataSourceDelegate {
    func deletePerson(index: Int) {
        viewModel.deletePerson(index: index)
    }
}
