//
//  TicketView.swift
//  CustomTicketView
//
//  Created by uiskim on 2022/11/05.
//

import UIKit
import SnapKit

class TicketView: UIView {
    
    let ticketView: UIView = {
        let ticket = UIView()
        ticket.backgroundColor = .white
        return ticket
    }()
    
    let ticketImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "moviewTitleImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "gdgdg"
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        ticketView.addSubview(ticketImage)
        ticketImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
    override func draw(_ rect: CGRect) {
        drawTicket()
        addDashedBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawTicket() {
        // MARK: - 티켓의 기본 틀을 그림
        let ticketShapeLayer = CAShapeLayer()
        ticketShapeLayer.frame = self.bounds
        ticketShapeLayer.fillColor = UIColor.white.cgColor
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
        ticketView.layer.mask = ticketShapeLayer
        ticketView.clipsToBounds = true
        
    }
    
    func addDashedBorder() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2
        // MARK: -  .lineDashPattern의 의미는 길이20과 빈공간5의 패턴으로 dashLine을 만들어달라는 뜻
        shapeLayer.lineDashPattern = [10,10]

        let path = CGMutablePath()
        path.addLines(between: [CGPoint(x: 18, y: 200),
                                CGPoint(x: self.frame.width-18, y: 200)])
        
        
        path.addLines(between: [CGPoint(x: 18, y: self.bounds.height - 100),
                                CGPoint(x: self.frame.width-18, y: self.bounds.height - 100)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    

}
