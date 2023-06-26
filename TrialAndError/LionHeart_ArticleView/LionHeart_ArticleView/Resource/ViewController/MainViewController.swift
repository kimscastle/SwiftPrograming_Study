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
    
    private let articleView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        articleView.separatorStyle = .none
        articleView.dataSource = self
        articleView.delegate = self
        
        articleView.register(ContentCell.self, forCellReuseIdentifier: ContentCell.identifier)
        articleView.register(QuoteCell.self, forCellReuseIdentifier: QuoteCell.identifier)
        articleView.register(TitleCell.self, forCellReuseIdentifier: TitleCell.identifier)
        articleView.register(ThumbNailCell.self, forCellReuseIdentifier: ThumbNailCell.identifier)
        articleView.register(BlockCell.self, forCellReuseIdentifier: BlockCell.identifier)
        
        view.addSubview(articleView)
        articleView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch articleData[indexPath.row] {
        case .thumbNail(let image):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbNailCell.identifier, for: indexPath) as? ThumbNailCell else { return ThumbNailCell() }
            cell.input = image
            cell.selectionStyle = .none
            return cell
        case .title(let title):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath) as? TitleCell else { return TitleCell() }
            cell.input = title
            cell.selectionStyle = .none
            return cell
        case .quote(let content):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuoteCell.identifier, for: indexPath) as? QuoteCell else { return QuoteCell() }
            cell.input = content
            cell.selectionStyle = .none
            return cell
        case .content(let content):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContentCell.identifier, for: indexPath) as? ContentCell else { return ContentCell() }
            cell.input = content
            cell.selectionStyle = .none
            return cell
        case .block(let content):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: BlockCell.identifier, for: indexPath) as? BlockCell else { return BlockCell() }
            cell.input = content
            cell.selectionStyle = .none
            return cell
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
}

