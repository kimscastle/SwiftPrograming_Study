//
//  Protocols.swift
//  CellReuseProblem
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

protocol TableViewCellReuseProtocol {
    static func register(tableView: UITableView)
    // MARK: - 여기서 Self는 타입인데 protocol을 채택하는 타입을 이야기함(확장성을 고려할수있게됨)
    static func dequeueReusableCell(tableView: UITableView) -> Self
    static var reuseIdentifier: String { get }
}

// MARK: - TableViewCelled라는 프로토콜은 기본값(defalult)를 가진다 -> 언제? -> UITableViewCell이라는 타입의 클래스에 채택되었을때만!
extension TableViewCellReuseProtocol where Self: UITableViewCell {
    static func register(tableView: UITableView) {
        // MARK: - 타입속성에서 self를 사용하면, 인스턴스가 아니라 타입자체를 가리킨다
        // 즉, 타입속성에서 다른 타입속성에 접근하려면 self로 접근해야한다
        tableView.register(self, forCellReuseIdentifier: self.reuseIdentifier)
        //== tableView.register(Self.self, forCellReuseIdentifier: self.reuseIdentifier)
        // MARK: - register에는 AnyClass라는 메타타입의 value값과 CellIdentifier이 들어가야함
        // cellidentifer은 다른 static변수인 reuseIdentifier을 넣어주면됨
        //tableView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellReuseIdentifier: <#T##String#>)
    }
    
    static func dequeueReusableCell(tableView: UITableView) -> Self {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier) else { fatalError("Error! \(self.reuseIdentifier)") }
        return cell as! Self
    }
    
    static var reuseIdentifier: String {
        // 타입속성에서 Self.self와 self는 같은 의미를 가진다
        return String(describing: self)
        //return String(describing: <#T##Subject#>)
        //Subject에는 메타타입의 value값을 넣어준다
    }
}
