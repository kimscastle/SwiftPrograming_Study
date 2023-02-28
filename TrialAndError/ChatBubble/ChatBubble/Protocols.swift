//
//  Protocols.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/28.
//

import UIKit

protocol BaseViewModel {
    associatedtype T
    var chatMessages: [T] { get }
    func fetchData()
    func getData() -> [T]
    func addData(_ data: T)
    func deleteData(index: Int)
}

protocol ReuseCellProtocol {
    static var cellId: String { get }
    static func register(tableView: UITableView)
    static func dequeueResuableCell(tableView: UITableView) -> Self
}

extension ReuseCellProtocol where Self: UITableViewCell {
    static var cellId: String {
        return String(describing: self)
    }
    
    static func register(tableView: UITableView) {
        tableView.register(self, forCellReuseIdentifier: self.cellId)
    }
    
    static func dequeueResuableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId) else { fatalError("error! \(self.cellId)")}
        return cell as! Self
    }
}
