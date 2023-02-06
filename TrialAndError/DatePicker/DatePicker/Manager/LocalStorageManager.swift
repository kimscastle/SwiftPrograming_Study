//
//  LocalStorageManager.swift
//  DatePicker
//
//  Created by uiskim on 2023/02/06.
//

import UIKit

class LocalStorageManger {
    static let shared = LocalStorageManger()
    
    // MARK: - UserDefaults를 사용할 때 어디서나 접근을 하게 하려면 싱글톤으로 접근을 해야하는데 LocalStorageManager을 생성자로 생성하게되면 안되니까 private init으로 생성자 막기
    private let userDefaults = UserDefaults.standard
    
    private init() {}
    
    func setDate(date: Date) {
        userDefaults.set(date, forKey: "date")
    }
    
    func readDate() -> Date {
        // MARK: - userDefault로 저장할때는 Any로 저장하므로 다운캐스팅을 해줘야한다
        guard let date = userDefaults.object(forKey: "date") as? Date else { return Date() }
        return date
    }
    
}
