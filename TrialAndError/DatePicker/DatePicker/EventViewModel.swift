//
//  EventViewModel.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit

final class EventViewModel {
    
    
    func fetch(seletedDate: Date) -> [Event] {
        let events = EventManager.shared.getEvents(firstDayDate: seletedDate)
        return events
        
    }
}
