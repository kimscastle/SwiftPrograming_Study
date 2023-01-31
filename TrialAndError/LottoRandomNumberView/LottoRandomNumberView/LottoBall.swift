//
//  LottoBall.swift
//  LottoRandomNumberView
//
//  Created by uiskim on 2022/12/01.
//

import UIKit
import SnapKit

enum LottoType {
    case normal
    case bounus
    
    var ballColor: UIColor {
        switch self {
        case .normal:
            return .blue
        case .bounus:
            return .brown
        }
    }
}

class LottoBall: UIView {
    
    static let ballSize = 38
    
    var ballNumber: Int {
        didSet {
            self.ballNumberLabel.text = String(ballNumber)
        }
    }
    
    let ballNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    init(lottoType: LottoType, LottoNumber: Int = .random(in: Int.lottoRange)) {
        ballNumber = LottoNumber
        super.init(frame: .zero)
        self.backgroundColor = lottoType.ballColor
        self.ballNumberLabel.text = String(LottoNumber)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(LottoBall.ballSize / 2)
        addSubview(ballNumberLabel)
        ballNumberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(20)
        }
    }
}
