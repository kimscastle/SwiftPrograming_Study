//
//  CodeMainViewController.swift
//  TableView
//
//  Created by uiskim on 2022/10/07.
//

import UIKit
import SnapKit

class CodeMainViewController: UIViewController {
    
    var movieDataManager = DataManager()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.rowHeight = 120
        view.addSubview(tv)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setUI()
        setNavigationBar()
        setUpData()
    }
    
    func setDelegate() {
        tableView.dataSource = self
        tableView.register(CodeMainTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        
    }
    
    func setNavigationBar() {
        title = "영화목록"
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setUI() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setUpData() {
        movieDataManager.makeMovieData()
    }
    
    @objc func plusButtonTapped() {
        print("플러스 버튼이 눌렸습니다")
        movieDataManager.updateMovieData()
        tableView.reloadData()
    }
}

extension CodeMainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDataManager.getMovieData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CodeMainTableViewCell
        let movies = movieDataManager.getMovieData()
        cell.setData(movies[indexPath.row])
        return cell
    }
}

extension CodeMainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = CodeDetailViewController()
        nextVC.data = movieDataManager.getMovieData()[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
