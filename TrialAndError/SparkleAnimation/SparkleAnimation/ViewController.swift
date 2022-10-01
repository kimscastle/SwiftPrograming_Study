//
//  ViewController.swift
//  SparkleAnimation
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

//MARK : - CAEmitterLayer란?
// Particle을 방출하고 움직이게하고 렌더링하는 레이어
// Particle은 CAEmitterLayer의 객체

class ViewController: UIViewController {
    
    //MARK : - Layer객체를 만들었으면 이객체에 어떤 Particle을 뿌려줄지를 정의해줘야한다
    private let emitterLayer = CAEmitterLayer()
    
    //MARK : - Particle정의
    // Label이나 Button정의하는거처럼 closure를 이용해서 정의해준다
    private let cell: CAEmitterCell = {
        let cell = CAEmitterCell()
        // 어떤 이미지를 넣을지를 정해주면 되는데
        // content는 "CGImage로 이미지를 콘텐츠로 표시할 수 있습니다"라는 설명이있다.
        // UIImage와 CGImage는 같은계층관계가 아니므로 타입캐스팅을 사용할수없고 UIImage를 CGImage로 바꿔주는 cgImage메서드를 사용해야한다.
        cell.contents = UIImage(named: "Star")?.cgImage
        
        // 얼마나 유지될건지를 설정해주는 매서드
        cell.lifetime = 1
        // 1초에 몇개 생성할건지를 알려주는 매서드
        cell.birthRate = 50
        
        // 크기를 설정해주는 매서드 - 이미지에서 배율을 정해서 그 크기의 이미지가 계속 나옴
        cell.scale = 0.5
        // particle 마다 달라질 수 있는 scale 의 범위 0.5로 설정했으면 가장작은 cell은 절반크기의 cell이고 가장큰 cell은 1.5배의 cell 랜덤비율로 cell이 나옴
        // 값이작아질수록 cell간의 편차가 작다
        cell.scaleRange = 0.2
        // 떨어지면서 크기를 조정해주고 싶으면 설정하는 매서드
        // -값을 넣는거같다고 한다 -0.1이나 -0.05정도가 적당한듯싶다
        cell.scaleSpeed = 0.05
        
        // spin을 2로 하고 range를 100으로 한 결과나 spin을 100으로 하고 range를 2로 설정한 결과가 아주아주 비슷
        // 얼마나 빠른 속도로 회전할것인가. 0이면 회전 효과 없음
        cell.spin = 2
        // spin 범위를 결정해주는 매서드
        cell.spinRange = 3
        
        // particle 이 방출되는 각도. 따라서 0 이면 linear 하게 방출됨.
        // 2pi = 360 도 = particle이 모든 방향으로 분산 됨.
        cell.emissionRange = CGFloat.pi * 2
        
        // 수치가 높을 수록 particle 이 빠르게, 더 멀리 방출되는 효과. yAcceleration에 의해 영향 받음
        // 100이면 아래로 주르르륵 나오는 느낌이고 700이면 팡팡 터지는 느낌으로 연출됨
        cell.velocity = 600
        // velocity 값의 범위를 뜻함.
        // 만약 기본 velocity가 700이고, velocityRange 가 50 이면,
        // 각 particle은 650-750 사이의 velocity 값을 갖게 됨
        // 없어도 되긴하는데 미묘한 차이가 보임
        cell.velocityRange = 300
        
        
        // gravity 효과.
        // 양수면 중력이 적용되는 것처럼 보이고, 음수면 중력이 없어져서 날아가는 것 처럼 보임.
        // velocity 와 yAcceleration의 조합이 distance 를 결정
        // 이 숫자가 작으면 체공시간이 길어지기때문에 lifetime이 작으면 중간에 없어지는게 눈에 확 띔
        cell.yAcceleration = 1000

        return cell
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        emitterLayer.emitterCells = [cell]
        setUpTapGestureRecognizer()
    }
    
    private func setUpTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let x = sender.location(in: view).x
        let y = sender.location(in: view).y
        
        //방출 point
        emitterLayer.emitterPosition = CGPoint(x: x, y: y)
        
        //cell 의 birth rate와 곱해져서 총 birth rate 가 정해짐
        emitterLayer.birthRate = 1

        //birthRate를 0을 설정해주지 않으면 시간동안 계속 cell을 방출함.
        // 한번 방출하고 끝내는것 처럼 보이게 엄청 짧게 설정
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            //birth rate 가 0이 되면 더 이상 값을 방출하지 않는 것처럼 보임
            self?.emitterLayer.birthRate = 0
        }
        // 레이어 얹어주면 방출 시작되는 것 보임.
        // 신기한건 클릭할때마다 addSublayer가 불리니까 layer가 계속 쌓일거 같은데 count 로 찍어보면 계속 1임
        view.layer.addSublayer(emitterLayer)
    }


}

