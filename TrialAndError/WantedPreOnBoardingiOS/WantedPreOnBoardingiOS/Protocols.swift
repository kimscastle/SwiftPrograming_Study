//
//  Protocols.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit

protocol CellReuseProtocol {
    static func register(tableView: UITableView)
    static func dequeueReusableCell(tableView: UITableView) -> Self
    static var reuseIdentifier: String { get }
}

extension CellReuseProtocol where Self: UITableViewCell {
    static func register(tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    static func dequeueReusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) else { fatalError("Error! \(self.reuseIdentifier)") }
        return cell as! Self
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
