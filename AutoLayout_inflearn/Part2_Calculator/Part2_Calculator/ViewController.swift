//
//  ViewController.swift
//  Part2_Calculator
//
//  Created by uiskim on 2023/03/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        //resultLabel.layer.cornerRadius = 20
        // MARK: - 둘중에 하나 편한걸로 사용하면된다
        //resultLabel.clipsToBounds = true
        //resultLabel.layer.masksToBounds = true
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // MARK: - 버튼은 masksToBounts를 설정안해도 된다
        btn1.layer.cornerRadius = btn1.bounds.width / 2
        btn2.layer.cornerRadius = btn1.bounds.width / 2
        btn3.layer.cornerRadius = btn1.bounds.width / 2
        btn4.layer.cornerRadius = btn1.bounds.width / 2
        btn5.layer.cornerRadius = btn1.bounds.width / 2
        btn6.layer.cornerRadius = btn1.bounds.width / 2
        btn7.layer.cornerRadius = btn1.bounds.width / 2
        btn8.layer.cornerRadius = btn1.bounds.width / 2
        btn9.layer.cornerRadius = btn1.bounds.width / 2
        btn10.layer.cornerRadius = btn1.bounds.height / 2
        btn11.layer.cornerRadius = btn1.bounds.width / 2
    }


}

