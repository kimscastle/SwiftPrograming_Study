//
//  MainViewModel.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/24.
//

import UIKit

class MainViewModel: BaseViewModel {

    typealias value = Model
    
    private var models = [Model]()
    
    func fetchData() {
        models = [
            .init(name: "김의성", age: 27),
            .init(name: "기믜성", age: 26)
        ]
    }
    
    func getDate() -> [Model] {
        return models
    }
    
    func addData(_ data: Model) {
        models.append(data)
    }
    
    func deleteData(index: Int) {
        models.remove(at: index)
    }    
}
