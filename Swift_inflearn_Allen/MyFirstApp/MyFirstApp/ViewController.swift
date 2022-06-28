//
//  ViewController.swift
//  MyFirstApp
//
//  Created by uiskim on 2022/06/26.
//
// 화면 하나당 화면을 관리한는 하나의 코드가있다
import UIKit

class ViewController: UIViewController {

    
    // Attribute: 속성
    // Interface Builder Outlet
    // 배출구(코드에서 화면으로 나감)
    @IBOutlet weak var mainLabel: UILabel!
    
    
    // 앱의 화면에 들어오면 처음 실행시키는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.backgroundColor = UIColor.yellow
    }

    // Interface Builder Action
    // 삽입구(화면에서 코드 안으로 들어옴)
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = UIColor.clear
//        mainLabel.backgroundColor = UIColor.green
//        mainLabel.textColor = UIColor.white
//        mainLabel.textAlignment = NSTextAlignment.left
        
        
    }
    
    
    

}

