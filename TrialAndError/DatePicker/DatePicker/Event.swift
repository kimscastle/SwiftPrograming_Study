//
//  Event.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import Foundation

struct Event {
    enum EventType {
        case hundred
        case year
        case today
    }
    
    let type: EventType
    
    let unit: Int
    
    init(type: EventType, unit: Int) {
        self.type = type
        self.unit = unit
    }
    
    private func findDate(date: Date) -> Date {
        switch type {
        case .hundred:
            return Calendar.current.date(byAdding: .day, value: unit - 1, to: date)!
        case .year:
            return Calendar.current.date(byAdding: .year, value: unit / 365, to: date)!
        case .today:
            return Date()
        }
    }
    
    // MARK: - dateString으로 변수명을 지으려고 헀는데 string대신 title이라는단어 좋은거같음
    func getDateTitle(date: Date) -> String {
        return DateFormatter().toYearMonthDay(date: findDate(date: date))
    }
    
    var title: String {
        switch type {
        // MARK: - 오늘이 그래서 며칠째 된거냐
        case .today:
            return "\(unit + 1)일"
        case .hundred:
            return "\(unit)일"
        case .year:
            return "\(unit / 365)주년"
        }
    }
    
    func count(date: Date) -> Int {
        return Calendar.countDaysFromNow(fromDate: findDate(date: date))
    }
    
}
