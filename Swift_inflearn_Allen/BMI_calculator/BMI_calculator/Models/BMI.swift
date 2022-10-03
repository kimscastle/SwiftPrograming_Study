//
//  BMI.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/10/03.
//

import UIKit

struct BMI {
    let value: Double 
    let matchColor: UIColor
    let advice: String
}

extension BMI {
    static let errorCase: BMI = {
        .init(value: 0.0, matchColor: .white, advice: "오류발생")
    }()
}
