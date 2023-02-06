//
//  EventManager.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit

class EventManager {
    static let shared = EventManager()
    
    func getEvents() -> [Event] {
        var events: [Event] = []
        // stride to a 는 a까지, stride through a 는 a포함, by는 얼마만큼의 간격으로
        for unit in stride(from: 100, through: 1000, by: 100) {
            let event = Event(type: .hundred, unit: unit)
            events.append(event)
        }
        
        for unit in stride(from: 365, through: 1000, by: 365) {
            let event = Event(type: .year, unit: unit)
            events.append(event)
        }
        
        events.append(Event(type: .today, unit: Calendar.countDaysFromNow(fromDate: LocalStorageManger.shared.readDate())))
        events.sort { $0.unit < $1.unit }
        return events
    }
}
