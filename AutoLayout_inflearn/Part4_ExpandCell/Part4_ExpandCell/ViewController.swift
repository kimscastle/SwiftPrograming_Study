//
//  ViewController.swift
//  Part4_ExpandCell
//
//  Created by uiskim on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    // 필요한 텍스트가 포함
    // expand 상태
    
    // Model
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels: [ExpandDataModel] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let textArray = ["short Text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long",
                         "short Text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long",
                         "short Text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long"
        ]
        
        for (_, value) in textArray.enumerated() {
            dataModels.append(.init(description: value, isExpand: false))
        }
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell", for: indexPath) as! ExpandTableViewCell
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            cell.descriptionLabel.numberOfLines = 0
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand.toggle()
        tableView.reloadData()
    }
}

