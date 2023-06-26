//
//  MainViewController.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit

import SnapKit

final class MainViewController: UIViewController {
    
    private let articleData = Article.datas()
    private let articleView = ArticleView()    
    private lazy var progressView = ArticleProgress()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        articleView.dataSource = self
        articleView.delegate = self

        view.addSubview(articleView)
        articleView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return articleData[indexPath.row].makeArticleCell(tableView: tableView, indexPath: indexPath)
    }
}

extension MainViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percentage = (scrollView.contentOffset.y / (scrollView.contentSize.height - scrollView.frame.size.height))
        progressView.progress = Float(percentage)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
