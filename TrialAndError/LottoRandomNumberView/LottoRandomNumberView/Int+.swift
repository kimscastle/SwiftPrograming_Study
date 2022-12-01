//
//  Int+.swift
//  LottoRandomNumberView
//
//  Created by uiskim on 2022/12/01.
//

import UIKit

extension Int {
    
    static let lottoRange: Range<Int> = 1..<30
    
    static func makeRandomIntArray(count: Int) -> [Int] {
        var returnArray: [Int] = []
        for _ in 0..<count {
            returnArray.append(Int.random(in: lottoRange))
        }
        return returnArray
    }
    
    static func makeRandomLottoNumber() -> Int {
        return Int.random(in: lottoRange)
    }
}
