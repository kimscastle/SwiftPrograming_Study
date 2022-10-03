//
//  BMICalculatorManager.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/10/03.
//

import UIKit

//MARK : - BMI를 계산해내는 객체
// ViewController와 소통을 해나간다
struct BIMClculatorManager {
    
    var bmi: Double?
    
    //MARK : - 구조체에서 속성자체의 값을 바꾸려면 ✅mutating키워드✅ 필요
    mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber  * 10) / 10
        bmi = bmiNumber
    }
    
    //MARK : - bmi가 옵셔널이니까 Double도 옵셔널
    // 만약 Double로 리턴하고 싶으면 ??으로 기본값 주면됨
    func getBMIResult() -> Double {
        return bmi ?? 0.0
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return .black }
        switch bmi {
        case ..<18.6:
            return .cyan
        case 18.6..<23.0:
            return .green
        case 23.0..<25.0:
            return .yellow
        case 25.0..<30.0:
            return .orange
        case 30.0...:
            return .red
        default:
            return .black
        }
    }
    
    func getAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
    
}
