//
//  EventViewModel.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit

final class EventViewModel {
    
    @Published var events: [Event] = []
    
    func fetch() {
        EventManager.shared.getEvents { events in
            self.events = events
        }
    }
}
