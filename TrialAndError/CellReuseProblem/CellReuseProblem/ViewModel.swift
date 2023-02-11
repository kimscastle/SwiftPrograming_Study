//
//  ViewModel.swift
//  CellReuseProblem
//
//  Created by uiskim on 2023/02/11.
//

import Foundation

final class ViewModel {
    
    var models = [Model]()
    
    func getModels() {
        models = [
            Model(name: "김의성1", age: 27),
            Model(name: "김의성2", age: 28),
            Model(name: "김의성3", age: 29)
        ]
    }
    
    func getModelsCount() -> Int {
        return models.count
    }
    
}
