//
//  TicketView.swift
//  CustomTicketView
//
//  Created by uiskim on 2022/11/05.
//

import UIKit

class TicketView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemBlue
//        clipsToBounds = true
//        layer.cornerRadius = 18
    }
    
    override func layoutSubviews() {
        drawTicket()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawTicket() {
        // MARK: - 티켓의 기본 틀을 그림
        let ticketShapeLayer = CAShapeLayer()
        ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = UIColor.red.cgColor
        let ticketShapePath = UIBezierPath(roundedRect: ticketShapeLayer.bounds, cornerRadius: 18)

        // MARK: - 어떤 영역을 빼는게 아니라 path를 알려줘서 그 path대로 따라가게 끔 만들어주는 방법
        // Path자체가 시계방향으로 그리는거라고 생각해야함 그러니까 topRightArcPath는 위에서 부터 시작해서 반시계방향으로 만들어줘야함
        let topLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 200),
                                          radius: 36 / 2,
                                          startAngle:  CGFloat(Double.pi / 2),
                                          endAngle: CGFloat(Double.pi + Double.pi / 2),
                                          clockwise: false)
        topLeftArcPath.close()

        
        let topRightArcPath = UIBezierPath(arcCenter: CGPoint(x: ticketShapeLayer.frame.width, y: 200),
                                          radius: 36 / 2,
                                          startAngle:  CGFloat(Double.pi + Double.pi / 2),
                                          endAngle: CGFloat(Double.pi / 2),
                                          clockwise: false)
        topRightArcPath.close()
        
        let bottomLeftArcPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: self.bounds.height - 100),
                                          radius: 36 / 2,
                                          startAngle:  CGFloat(Double.pi / 2),
                                          endAngle: CGFloat(Double.pi + Double.pi / 2),
                                          clockwise: false)
        bottomLeftArcPath.close()

        
        let bottomRightArcPath = UIBezierPath(arcCenter: CGPoint(x: ticketShapeLayer.frame.width, y: self.bounds.height - 100),
                                          radius: 36 / 2,
                                          startAngle:  CGFloat(Double.pi + Double.pi / 2),
                                          endAngle: CGFloat(Double.pi / 2),
                                          clockwise: false)
        bottomRightArcPath.close()

        // MARK: - ticketShapePath에 두가지 패스를 추가해준다
        ticketShapePath.append(topLeftArcPath)
        ticketShapePath.append(topRightArcPath)
        ticketShapePath.append(bottomLeftArcPath)
        ticketShapePath.append(bottomRightArcPath)
        ticketShapeLayer.path = ticketShapePath.cgPath
        layer.addSublayer(ticketShapeLayer)
    }
    

}
