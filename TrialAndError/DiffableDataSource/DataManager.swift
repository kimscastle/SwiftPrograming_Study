//
//  DataManager.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

class DataManager {
    static let shared = DataManager()
    
    func getData(completionHandler: @escaping(([Person]) -> Void)) {
        var people = [Person]()
        people = [
            .init(name: "김의성", age: 27, address: "경기도 남양주시"),
            .init(name: "김유스", age: 26, address: "경상북도 포항시"),
            .init(name: "김찰리", age: 25, address: "경상남도 부산시")
        ]
        completionHandler(people)
    }
}
