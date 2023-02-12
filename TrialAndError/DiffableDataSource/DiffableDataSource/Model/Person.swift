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
