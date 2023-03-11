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
    
    private var testTableView = UITableView()
    
    private lazy var appendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("추가버튼", for: .normal)
        //self가 정의되기전에 button이 생성되서 그런건지 warning이 발생 lazy를 사용하면 이런 문제 해결
        button.addTarget(self, action: #selector(appendButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func appendButtonTapped() {
        viewModel.appendModel()
        testTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getModels()
        setUI()
        setTableView()
        
    }
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        view.addSubview(appendButton)
        appendButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func setTableView() {
        // MARK: - 여기서 AnyClass는 typeAlias이며 메타타입이다. 즉, 여기다가는 타입을 넘겨줘야하는데 타입의 value를 넘겨줘야하므로 타입.self로 넘겨줬던것이다
        //testTableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
        // 기존 : testTableView.register(TestTableViewCell.self, forCellReuseIdentifier: TestTableViewCell.identifier)
        TestTableViewCell.register(tableView: testTableView)
        testTableView.dataSource = self
        // MARK: - 이거 없으면 경고뜸
        testTableView.rowHeight = 70
        view.addSubview(testTableView)
        testTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension TestViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getModelsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 기존 : guard let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.identifier, for: indexPath) as? TestTableViewCell else { return UITableViewCell() }
        let cell = TestTableViewCell.dequeueReusableCell(tableView: testTableView)
        cell.data = viewModel.models[indexPath.row]
        return cell
    }
}
