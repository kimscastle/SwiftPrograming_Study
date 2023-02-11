//
//  CellReusableProtocol.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

protocol CellReusableProtocol {
    static var identifier: String { get }
    static func register(tableView: UITableView)
    static func reusableCell(tableView: UITableView) -> Self
}


extension CellReusableProtocol where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func register(tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: self.identifier)
    }
    
    static func reusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier) else { fatalError("error \(self.identifier)")}
        return cell as! Self
    }
}
