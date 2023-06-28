//
//  ViewController.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import UIKit
import SnapKit

final class ArticleViewController: UIViewController {

    // MARK: - UI Components

    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .default
        progressBar.tintColor = .black
        return progressBar
    }()

    private let articleTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        return tableView
    }()

    // MARK: - var & let

    private let dummy = Article.dummy()

    override func viewDidLoad() {
        super.viewDidLoad()
        hirerachy()
        setStyle()
        setLayout()
        setTableView()
    }

    private func setTableView() {
        articleTableView.allowsSelection = false
        articleTableView.separatorStyle = .none
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.register(ThumbnailTableViewCell.self, forCellReuseIdentifier: ThumbnailTableViewCell.identifier)
        articleTableView.register(QuotationTableViewCell.self, forCellReuseIdentifier: QuotationTableViewCell.identifier)
        articleTableView.register(QuotationTableViewCell.self, forCellReuseIdentifier: QuotationTableViewCell.identifier)
        articleTableView.register(BodyTableViewCell.self, forCellReuseIdentifier: BodyTableViewCell.identifier)
        articleTableView.register(CallOutTableViewCell.self, forCellReuseIdentifier: CallOutTableViewCell.identifier)

    }

    private func hirerachy() {
        view.addSubview(progressBar)
        view.addSubview(articleTableView)
    }

    private func setStyle() {
        view.backgroundColor = .white
    }

    private func setLayout() {
        progressBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }

        articleTableView.snp.makeConstraints { make in
            make.top.equalTo(progressBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension ArticleViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let progress = scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.frame.height)
        progressBar.setProgress(Float(progress), animated: true)
        print(scrollView.contentSize.height)
    }
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch dummy[indexPath.row] {
        case .thumbnail(let header):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTableViewCell.identifier, for: indexPath) as? ThumbnailTableViewCell else { return ThumbnailTableViewCell() }
            cell.configCell(header)
            return cell
        case .quotation(let str):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuotationTableViewCell.identifier, for: indexPath) as? QuotationTableViewCell else { return QuotationTableViewCell() }
            cell.configCell(str)
            return cell
        case .body(let str):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BodyTableViewCell.identifier, for: indexPath) as? BodyTableViewCell else { return BodyTableViewCell() }
            cell.configCell(str)
            return cell
        case .callOut(let str):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CallOutTableViewCell.identifier, for: indexPath) as? CallOutTableViewCell else { return CallOutTableViewCell() }
            cell.configCell(str)
            return cell
        }
    }


}
