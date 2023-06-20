//
//  ViewController.swift
//  CollectionViewSection
//
//  Created by uiskim on 2023/06/20.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private var testData = Poster.dummy()
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: ContentTableViewCell.cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    
    func numberOfSections(in tableView: UITableView) -> Int { return testData.count }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? { return testData[section].title }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentTableViewCell.cellID, for: indexPath) as? ContentTableViewCell else { return ContentTableViewCell() }
        cell.data = testData[indexPath.section]
        cell.selectionStyle = .none
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return testData[indexPath.section].cellSize.height
    }
}
