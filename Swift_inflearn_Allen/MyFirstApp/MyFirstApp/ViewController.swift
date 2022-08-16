//
//  ViewController.swift
//  MyFirstApp
//
//  Created by uiskim on 2022/08/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLabel.text = "안녕하세요"
        mainLabel.textColor = UIColor.white
        mainLabel.backgroundColor = #colorLiteral(red: 0.8155849576, green: 0.637394309, blue: 1, alpha: 1)
        mainLabel.textAlignment = NSTextAlignment.left
        
        myButton.backgroundColor = UIColor.red
    }
}

