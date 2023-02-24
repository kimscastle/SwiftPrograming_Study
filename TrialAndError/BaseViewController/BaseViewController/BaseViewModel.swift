//
//  BaseViewModel.swift
//  BaseViewController
//
//  Created by uiskim on 2023/02/24.
//

import UIKit

protocol BaseViewModel {
    // MARK: - value 에는 어떤 타입일지 모르기 때문에 associatedtype을 사용합니다.
    associatedtype value
    
    func fetchData()
    func getDate() -> [value]
    func addData(_ data: value)
}
