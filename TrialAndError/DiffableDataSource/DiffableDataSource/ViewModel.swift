//
//  ViewModel.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit

class ViewModel {
    var people = [Person]()
    
    func fetchPeople() {
        DataManager.shared.getData { people in
            self.people = people
        }
    }
    
    func deletePerson(index: Int) {
        people.remove(at: index)
    }
    
}
