//
//  LottoNumbersView.swift
//  LottoRandomNumberView
//
//  Created by uiskim on 2022/12/01.
//

import UIKit
import SnapKit

class LottoNumbersView: UIView {
    
    var lottoNumbers: [Int] {
        didSet {
            firstNumberBall.ballNumber = lottoNumbers[0]
            secondNumberBall.ballNumber = lottoNumbers[1]
            thirdNumberBall.ballNumber = lottoNumbers[2]
            fourthNumberBall.ballNumber = lottoNumbers[3]
        }
    }

    
    lazy var firstNumberBall = LottoBall(lottoType: .normal)
    lazy var secondNumberBall = LottoBall(lottoType: .normal)
    lazy var thirdNumberBall = LottoBall(lottoType: .normal)
    lazy var fourthNumberBall = LottoBall(lottoType: .bounus)

    init(numbers: [Int]) {
        self.lottoNumbers = numbers
        super.init(frame: .zero)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        addSubview(firstNumberBall)
        addSubview(secondNumberBall)
        addSubview(thirdNumberBall)
        addSubview(fourthNumberBall)
        
        firstNumberBall.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(LottoBall.ballSize)
        }
        
        secondNumberBall.snp.makeConstraints { make in
            make.leading.equalTo(firstNumberBall.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(LottoBall.ballSize)
        }
        
        thirdNumberBall.snp.makeConstraints { make in
            make.leading.equalTo(secondNumberBall.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(LottoBall.ballSize)
        }
        
        fourthNumberBall.snp.makeConstraints { make in
            make.leading.equalTo(thirdNumberBall.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.size.equalTo(LottoBall.ballSize)
        }
    }
}
