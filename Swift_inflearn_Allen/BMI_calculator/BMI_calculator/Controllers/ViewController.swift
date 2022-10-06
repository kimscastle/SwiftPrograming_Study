//
//  ViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/09/30.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    //MARK : - BMI의 비지니스 로직을 담당하는 객체
    var bmiManager = BIMClculatorManager()
    
    //MARK : - bmi숫자를 관리하는것도 비지니스로직이기때문에 아래 변수도 매니저에게 줘야한다
    //var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightTextField.delegate = self
        weightTextField.delegate = self
        render()
    }
    
    func render() {
        mainLabel.text = "키와 몸무게를 입력해주세요"
        
        //MARK : - 코너를 둥굴게 만드는 방법
        // 스토리보드에서 만든는것보다 코드로만드는게 훨씬 편함
        calculateButton.clipsToBounds = true
        calculateButton.layer.cornerRadius = 5
        calculateButton.setTitle("BMI 계산하기", for: .normal)
        
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        // 어차피 빈문자열이면 segue가 없기때문에 강제언래핑 해도 괜찮음
        //calculateBMI(height: heightTextField.text!, weight: weightTextField.text!)
        
//        guard let height = heightTextField.text,
//              let weight = weightTextField.text else { return }
        
        //bmiManager.calculateBMI(height: height, weight: weight)
        //bmiManager.getBMIResult()
        //bmi = calculateBMI(height: height, weight: weight)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야합니다!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    // 재정의하지 않아도 무조건 실행됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmiManager.getBMIResult(height: heightTextField.text!, weight: weightTextField.text!)
        }
        
        // 다음화면으로 가기전에 텍스트 필드 비우기
        heightTextField.text = ""
        weightTextField.text = ""
    }
}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //MARK : - if, else if문에서 범위가 작은걸 먼저쓰는게 중요하다
        // 두개 텍스트 필드를 모두종료(키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 아래의 텍스트필드로 커서 이동
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}