//
//  SecondViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmiNumber: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()

    }
    
    func render() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        backButton.setTitle("다시 계산하기", for: .normal)
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        
        guard let bmi = bmiNumber else { return }
        bmiNumberLabel.text = String(bmi)
        bmiNumberLabel.backgroundColor = bmiColor
        adviceLabel.text = adviceString
        
        
    }

    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    } 
}
