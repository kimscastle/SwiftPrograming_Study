//
//  Menu.swift
//  RxSwift+MVVM
//
//  Created by uiskim on 2022/10/18.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation

// ViewModel
struct Menu {
    var id: Int
    var name: String
    var price: Int
    var count: Int
}

extension Menu {
    static func fromMenuItems(index: Int, item: MenuItem) -> Menu {
        return Menu(id: index, name: item.name, price: item.price, count: 0)
    }
}
