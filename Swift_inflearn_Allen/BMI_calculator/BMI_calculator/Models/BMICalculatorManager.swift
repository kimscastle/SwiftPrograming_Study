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
    
    var bmi: BMI?
    
    //MARK : - 구조체에서 속성자체의 값을 바꾸려면 ✅mutating키워드✅ 필요
    private mutating func calculateBMI(height: String, weight: String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI.errorCase
            return
        }
        var bmiNumber = w / (h * h) * 10000
        bmiNumber = round(bmiNumber  * 10) / 10
        
        switch bmiNumber {
        case ..<18.6:
            bmi = BMI(value: bmiNumber, matchColor: .cyan, advice: "저체중")
        case 18.6..<23.0:
            bmi = BMI(value: bmiNumber, matchColor: .green, advice: "표준")
        case 23.0..<25.0:
            bmi = BMI(value: bmiNumber, matchColor: .yellow, advice: "과체중")
        case 25.0..<30.0:
            bmi = BMI(value: bmiNumber, matchColor: .orange, advice: "중도비만")
        case 30.0...:
            bmi = BMI(value: bmiNumber, matchColor: .red, advice: "고도비만")
        default:
            bmi = BMI.errorCase
        }
        
    }
    
    //MARK : - bmi가 옵셔널이니까 Double도 옵셔널
    // 만약 Double로 리턴하고 싶으면 ??으로 기본값 주면됨
    mutating func getBMIResult(height: String, weight: String) -> BMI {
        // 이함수를 실행시키면 bmi가 업데이트 된다
        calculateBMI(height: height, weight: weight)
        return bmi ?? BMI.errorCase
    }
}
