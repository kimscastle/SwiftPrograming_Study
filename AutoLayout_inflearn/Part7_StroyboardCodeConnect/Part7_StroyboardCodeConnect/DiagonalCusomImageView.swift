//
//  DiagonalCusomImageView.swift
//  Part7_StroyboardCodeConnect
//
//  Created by uiskim on 2023/03/23.
//

import UIKit

@IBDesignable
class DiagonalCusomImageView: UIImageView {

    // 대각선으로 잘린 사각형을 그린다
    // 1. bezierPath를 그린다
    // 2. path -> layer화시켜야함
    // 3. layer와 layer를 masking하면됨
    
    // 4. 내가만든 커스텀코드 -> storyboard 편집화면에서 바로 확인 -> @IBDesignable키워드 추가
    
    @IBInspectable var innerHeight: CGFloat = 0
    
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        // 시작점
        path.move(to: .zero)
        
        // 그리기 시작
        path.addLine(to: .init(x: self.bounds.width, y: 0))
        path.addLine(to: .init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: .init(x: 0, y: self.bounds.height - innerHeight))
        
        // 그리기 끝
        path.close()
        return path
    }
    
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        return shapeLayer
    }
    
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    // 뷰를 그릴때 자동으로 실행되는 함수
    override func layoutSubviews() {
        makeMask()
    }
}
