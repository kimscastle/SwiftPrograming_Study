//
//  EventViewModel.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit

final class EventViewModel {
    
    @Published var event: [Event] = []
    
    func fetch() {
        self.event = EventManager.shared.getEvents()
        
    }
}
