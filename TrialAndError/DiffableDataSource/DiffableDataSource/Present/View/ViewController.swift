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
        
        // 4.diffableDataSource를 생성해서 2번에 대입
        diffableDataSource = CustomDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = DiffableTableViewCell.reusableCell(tableView: tableView)
            // MARK: - indexPath.row를 사용하는게 아니라 그냥 itemIdentifier를 넣어주면 된다
            cell.data = itemIdentifier
            return cell
        })
        
        diffableDataSource.delegate = self
        
        // 5. snapShot인스턴스를 만들어서 3번에 대입
        snapShot = NSDiffableDataSourceSnapshot()
        
        // 6. snapShot에 Section추가(enum으로 만들어놓는게좋음 hashable하기때문)
        snapShot.appendSections([.main])
        
        // 7. snapShot에 Items를 추가
        snapShot.appendItems(viewModel.people, toSection: .main)
        
        // 8. 4번에서만든 diffableDataSource에 snapShot을 apply
        diffableDataSource.apply(snapShot, animatingDifferences: true)
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func appendPersonButtonTapped() {
        let nextViewController = DetailViewController()
        nextViewController.delegate = self
        present(nextViewController, animated: true)
    }
}

extension ViewController: CustomDiffableDataSourceDelegate {
    func addPerson(person: Person) {
        viewModel.addPerson(person: person)
        
        // 9. 뭔가가 바뀔때마다 snapShot을 만들어주고 item을 넣은다음에 dataSource에 apply해주면 기존 snapShot과 비교해서 ui를 변경해주는 느낌
        var snapShot = diffableDataSource.snapshot()
        snapShot.appendItems([person], toSection: .main)
        diffableDataSource.apply(snapShot, animatingDifferences: true)
    }
    
    func deletePerson(index: Int) {
        viewModel.deletePerson(index: index)
    }
    
}
