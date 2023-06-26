//
//  ArticleContentType.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit.UIImage

enum ArticleContentType {
    case thumbNail(UIImage)
    case title(Header)
    case quote(String)
    case content(String)
    case block(String)
}

struct Header {
    let title: String
    let uploadDate: String
    let publisher: String
}

extension ArticleContentType {
    func makeArticleCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        switch self {
        case .thumbNail(let image):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbNailCell.identifier, for: indexPath) as? ThumbNailCell else { return ThumbNailCell() }
            cell.input = image
            cell.selectionStyle = .none
            return cell
        case .title(let header):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleCell.identifier, for: indexPath) as? TitleCell else { return TitleCell() }
            cell.input = header
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
