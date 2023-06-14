//
//  TableViewCellReuseProtocol.swift
//  ArticleRecommendationApp
//
//  Created by uiskim on 2023/06/14.
//

import UIKit.UITableView

import SnapKit

protocol TableViewCellReuseProtocol: BaseTableViewCell {
    static var cellIdentifier: String { get }
    static func register(tableview: UITableView)
    static func dequeueReuseCell(tableView: UITableView, input: T) -> Self
}


extension TableViewCellReuseProtocol {
    static var cellIdentifier: String {
        return String(describing: self)
    }
    
    static func register(tableview: UITableView) {
        tableview.register(self, forCellReuseIdentifier: self.cellIdentifier)
    }
    
    static func dequeueReuseCell(tableView: UITableView, input: T) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? Self else { fatalError("\(self.cellIdentifier)") }
        cell.dataBind(input: input)
        return cell
    }
}

protocol BaseTableViewCell where Self: UITableViewCell {
    associatedtype T
    func dataBind(input: T)
}
