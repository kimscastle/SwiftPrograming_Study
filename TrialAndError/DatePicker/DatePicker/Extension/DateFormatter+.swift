//
//  DateFormatter+.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import Foundation

extension DateFormatter {
    func toYearMonthDay(date: Date) -> String {
        // MARK: - DateFomatter객체의 dateFormat이라는걸 바꿔주는거니까 self를 사용
        self.dateFormat = "yyyy.MM.dd"
        self.locale = Locale(identifier: "ko_KR")
        return self.string(from: date)
    }
}
