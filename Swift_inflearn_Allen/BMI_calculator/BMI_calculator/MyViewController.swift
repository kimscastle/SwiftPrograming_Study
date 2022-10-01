//
//  MyViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

class MyViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var someString: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
