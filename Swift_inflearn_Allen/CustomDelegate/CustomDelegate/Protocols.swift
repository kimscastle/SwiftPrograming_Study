//
//  Protocols.swift
//  CustomDelegate
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

protocol CellReuseProtocol {
    static var identifier: String { get }
    static func register(tableView: UITableView)
    // 프로토콜에서의 Self는 프로토콜을 채택한 타입
    static func reusableCell(tableView: UITableView) -> Self
}

extension CellReuseProtocol where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func register(tableView: UITableView) {
        tableView.register(Self.self, forCellReuseIdentifier: self.identifier)
    }
    
    static func reusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier) else { fatalError("error\(self.identifier)") }
        // cell자체를 구체화 시켜서 보내줘야함
        return cell as! Self
    }
}
