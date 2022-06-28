//
//  ViewController.swift
//  MyFirstApp
//
//  Created by uiskim on 2022/06/26.
//
// 화면 하나당 화면을 관리한는 하나의 코드가있다
import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
//        mainLabel.backgroundColor = UIColor.green
//        mainLabel.textColor = UIColor.white
//        mainLabel.textAlignment = NSTextAlignment.left
        
        
    }
    
    
    

}

