//
//  ViewController.swift
//  Combine_Basic
//
//  Created by uiskim on 2022/11/12.
//

import UIKit
import Combine

import SnapKit

class ViewController: UIViewController {
    
    let viewModel = CombineViewModel()
    var cancelBag = Set<AnyCancellable>()
    
    let combineTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CombineTableViewCell.self, forCellReuseIdentifier: CombineTableViewCell.cellId)
        return tableView
    }()
    
    lazy var appendButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.setTitle("추가하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(appendButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(combineTableView)
        view.addSubview(appendButton)
        combineTableView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(300)
        }
        
        appendButton.snp.makeConstraints { make in
            make.top.equalTo(combineTableView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.size.equalTo(50)
            
        }
        combineTableView.dataSource = self
        // Do any additional setup after loading the view.
        viewModel.fetchTitleDatas()
        
        viewModel.$title
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recievedValue in
                print(recievedValue)
                self?.combineTableView.reloadData()
            }
            .store(in: &cancelBag)
    }
    
    @objc func appendButtonTapped() {
        print("추가버튼이 눌렸습니다")
        viewModel.appendData(data: .init(title: "추가된 데이터", comenet: "ㅎㅎㅎ"))
    
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CombineTableViewCell.cellId, for: indexPath) as? CombineTableViewCell else { return CombineTableViewCell() }
        cell.data = viewModel.title[indexPath.row]
        return cell
    }
    
    
}

