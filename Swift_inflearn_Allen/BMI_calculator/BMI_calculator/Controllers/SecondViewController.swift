//
//  SecondViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

//MARK : - SecondViewController로 데이터를 보낼때 세가지 데이터를 보내기때문에 이 데이터들을 묶고싶다
class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    // var bmiNumber: Double?
    // var adviceString: String?
    // var bmiColor: UIColor?
    
    var bmi: BMI?
    
    
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
        
        guard let bmi = bmi else { return }
        updateUI(bmi)
        
        
    }
    
    private func updateUI(_ model: BMI) {
        bmiNumberLabel.text = String(model.value)
        bmiNumberLabel.backgroundColor = model.matchColor
        adviceLabel.text = model.advice
    }

    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    } 
}
