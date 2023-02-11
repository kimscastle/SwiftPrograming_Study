//
//  Model.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

struct Person: Hashable {
    let name: String
    let age: Int
    let address: String
}

enum Section {
    case main
}

class CustomDiffableDataSource: UITableViewDiffableDataSource<Section, Person> {
    
    //var deletePerson: ((Int) -> Void)?
    
    var delegate: CustomDiffableDataSourceDelegate?
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let item = itemIdentifier(for: indexPath) else {
            return
        }
        var snapShot = self.snapshot()
        snapShot.deleteItems([item])
        delegate?.deletePerson(index: indexPath.row)
        //deletePerson?(indexPath.row)
        self.apply(snapShot, animatingDifferences: true)
    }
}

protocol CustomDiffableDataSourceDelegate {
    func deletePerson(index: Int)
}
