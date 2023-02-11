//
//  ViewController.swift
//  CellReuseProblem
//
//  Created by uiskim on 2023/02/11.
//

import UIKit
import SnapKit

final class TestViewController: UIViewController {
    
    var viewModel: ViewModel
    
    var testTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getModels()
        setTableView()
        
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        // MARK: - 여기서 AnyClass는 typeAlias이며 메타타입이다. 즉, 여기다가는 타입을 넘겨줘야하는데 타입의 value를 넘겨줘야하므로 타입.self로 넘겨줬던것이다
        //testTableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        testTableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
        testTableView.dataSource = self
        // MARK: - 이거 없으면 경고뜸
        testTableView.rowHeight = 70
        view.addSubview(testTableView)
        testTableView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.edges.equalToSuperview()
        }
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getModelsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        cell.data = viewModel.models[indexPath.row]
        return cell
    }
    
    
}
