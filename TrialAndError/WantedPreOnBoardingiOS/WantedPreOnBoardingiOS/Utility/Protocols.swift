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
        tableView.register(Self.self, forCellReuseIdentifier: self.reuseIdentifier)
    }
    
    // MARK: - Protocol에서의 Self는 채택한 타입자체를 가리킴
    static func dequeueReusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) else { fatalError("Error! \(self.reuseIdentifier)") }
        return cell as! Self
    }
    
    static var reuseIdentifier: String {
        // MARK: - 모든 Type의 instance를 문자열로 변환
        // static(타입속성)에서 Self.self == self이다
        // 메타타입의 인스턴스 == Self(메타타입).self(의 인스턴스) == self
        return String(describing: Self.self)
    }
}
