//
//  SecondViewController.swift
//  HowToMoveScreen
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    var someString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = someString
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    

}
