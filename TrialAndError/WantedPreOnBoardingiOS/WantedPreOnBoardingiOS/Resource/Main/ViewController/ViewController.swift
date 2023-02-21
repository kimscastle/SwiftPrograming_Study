//
//  ViewController.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private var viewModel = ViewModel()
    
    private let imageLoadTableView = UITableView()
    
    private lazy var imageAllLoadButton: UIButton = {
        let button = UIButton(type: .system)
        button.createCustomButton(title: "Load All Images", cornerRadius: 10)
        button.addTarget(self, action: #selector(imageAllLoadButtonTapped), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        setUI()
        viewModel.fetchImageUrls()
    }
    
    private func tableViewSetting() {
        ImageLoadTableViewCell.register(tableView: imageLoadTableView)
        imageLoadTableView.dataSource = self
        imageLoadTableView.delegate = self
        imageLoadTableView.separatorStyle = .none

        view.addSubview(imageLoadTableView)
        imageLoadTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(500)
        }
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(imageAllLoadButton)
        imageAllLoadButton.snp.makeConstraints { make in
            make.top.equalTo(imageLoadTableView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    @objc func imageAllLoadButtonTapped() {
        viewModel.isLoad = true
        imageLoadTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getImageUrls().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageLoadTableViewCell.dequeueReusableCell(tableView: imageLoadTableView)
        cell.selectionStyle = .none
        cell.imageUrl = viewModel.getImageUrls()[indexPath.row]
        if viewModel.isLoad {
            cell.loadImage()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellSize.cellHight
    }
}

