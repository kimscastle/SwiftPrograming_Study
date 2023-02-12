//
//  CustomDiffableDataSource.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/12.
//

import UIKit

class CustomDiffableDataSource: UITableViewDiffableDataSource<Section, Person> {
    
    var delegate: CustomDiffableDataSourceDelegate?
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { return true }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard let item = itemIdentifier(for: indexPath) else {
            return
        }
        var snapShot = self.snapshot()
        snapShot.deleteItems([item])
        delegate?.deletePerson(index: indexPath.row)
        self.apply(snapShot, animatingDifferences: true)
    }
}
