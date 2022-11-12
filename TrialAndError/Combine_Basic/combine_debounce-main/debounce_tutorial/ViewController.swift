//
//  ViewController.swift
//  debounce_tutorial
//
//  Created by Jeff Jeong on 2020/10/14.
//

import UIKit
import Combine

class ViewController: UIViewController {

    
    @IBOutlet var myLabel: UILabel!
    private lazy var searchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.tintColor = .black
        searchController.searchBar.searchTextField.accessibilityIdentifier = "mySearchBarTextField"
        return searchController
    }()
    
    var mySubscription = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.searchController = searchController
        searchController.isActive = true
        
        searchController.searchBar.searchTextField
            .myDebounceSearchPublisher
            .sink { [weak self] receivedValue in
                print(receivedValue)
                self?.myLabel.text = receivedValue
            }
            .store(in: &mySubscription)
    }
}

extension UITextField {
    var myDebounceSearchPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { $0.object as? UITextField }
            .map { $0.text ?? "" }
            //데이터를 어느 주기로 받을래? textfield 입력이 마무리되고 1초후에 데이터를 publish하겟다
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            //text가 0글자면 이벤트가 publish되지 않는다
            .filter { $0.count > 0 }
            .eraseToAnyPublisher()
    }
}
