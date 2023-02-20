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
        button.setTitle("image all load", for: .normal)
        button.addTarget(self, action: #selector(imageAllLoadButtonTapped), for: .touchUpInside)
        button.backgroundColor = .blue
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetting()
        setUI()
        viewModel.getImageUrls()
    }
    
    private func tableViewSetting() {
        ImageLoadTableViewCell.register(tableView: imageLoadTableView)
        imageLoadTableView.dataSource = self
        imageLoadTableView.delegate = self
        imageLoadTableView.rowHeight = 100

        view.addSubview(imageLoadTableView)
        imageLoadTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.right.equalToSuperview()
            make.height.equalTo(500)
        }
    }
    
    private func setUI() {
        view.addSubview(imageAllLoadButton)
        imageAllLoadButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(100)
            make.size.equalTo(100)
        }
    }
    
    @objc func imageAllLoadButtonTapped() {
        viewModel.isLoad = true
        imageLoadTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ImageLoadTableViewCell.dequeueReusableCell(tableView: imageLoadTableView)
        cell.imageUrl = viewModel.imageUrls[indexPath.row]
        if viewModel.isLoad {
            cell.loadImage()
        }
        return cell
    }
}

