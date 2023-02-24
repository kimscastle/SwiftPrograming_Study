//
//  MainViewModel.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/24.
//

import UIKit

class MainViewModel: BaseViewModel {
    
    typealias value = Model
    
    private var models: [Model] = [.init(name: "김의성", age: 27)]
    
    func fetchData() {
        print("fetchData")
    }
    
    func checkViewModel() {
        print("viewmodel체크")
    }
    
    func getDate() -> [Model] {
        return models
    }
    
    func addData(_ data: Model) {
        models.append(data)
    }
    
}
