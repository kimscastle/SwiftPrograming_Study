//
//  ViewController.swift
//  SnapKit_Practice
//
//  Created by uiskim on 2022/09/29.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var firstView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        view.addSubview(v)
        return v
    }()
    
    lazy var secondView: UIView = {
        let v = UIView()
        v.backgroundColor = .blue
        firstView.addSubview(v)
        return v
    }()
    
    lazy var thridView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        view.addSubview(v)
        return v
    }()

    lazy var fourthView: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        view.addSubview(v)
        return v
    }()
    
    lazy var fifthView: UIView = {
        let v = UIView()
        v.backgroundColor = .cyan
        fourthView.addSubview(v)
        return v
    }()
    
    lazy var sixthView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        view.addSubview(v)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render()
    }
    
    func render() {
        // red
        firstView.snp.makeConstraints { make in
            //MARK : - 객체를 superView의 가운데에 위치시키는 코드
            // center은 centerX와 centerY를 모두 지칭하는 메서드
            // eqalToSuperview()는 상위뷰와 똑같이 하겠다는 메서드
            make.center.equalToSuperview()
            
            //MARK : - 객체의 너비와 높이를 정하는 세가지 방법
            // 1. size.equalTo(길이) : size는 width와 height를 모두 지칭함
            // 이 코드의 단점은 width와 height가 같은 경우에만 사용할 수 있다는 점이다
            // 정사각형모양이라면 편리하게 사용할 수 있는 코드
            make.size.equalTo(100)
            
            // 2. 단순하게 width와 height모두 100이라는 길이로 설정하겠다는 코드
            //make.width.height.equalTo(100)
            
            // 3. width와 height를 따로 100씩 설정하는 코드
            // 이 코드의 장점은 width와 height의 길이가 다르다면 사용하기 편리하다는 점이다
            //make.width.equalTo(100)
            //make.height.equalTo(100)
        }
        
        // blue
        secondView.snp.makeConstraints { make in
            //make.center.equalToSuperview()
            //MARK : - 가운데 정렬을 따로하고 싶으면 centerX와 centerY로 나눠야한다
            make.centerX.equalToSuperview().offset(10)
            // centerY의 경우 top기준으로 안쪽으로 넣는다라는 느낌으로 offset을 사용하고 양수면 아래(안)쪽 음수면 위(바깥)쪽으로 생각
            make.centerY.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(80)
        }
        
        // green
        thridView.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        // black
        fourthView.snp.makeConstraints { make in
            make.top.equalTo(thridView.snp.top)
            //MARK : - inset과 offset의 차이점
            // 안쪽으로 밀어넣는 개념(양수) 바깥쪽으로 빼는 개념(음수)
            // top, left는 offset을 사용(기준선을 기준으로 안쪽(오른쪽)으로 넣으면 양수 바깥쪽(왼쪽)으로 빼면 음수)
            // bottom, right는 inset을 사용(기준선을 기준으로 안쪽(왼쪽)으로 넣으면 양수 바깥쪽(오른쪽)으로 빼면 음수)
            
            // 코드를 보면 black 블럭의 왼쪽(왼쪽이니까 우선적으로 offset) 기준선인 초록색의 오른쪽에서 오른쪽으로 보내고 싶음(양수)
            make.leading.equalTo(thridView.snp.trailing).offset(50)
            
            // 코드를 보면 view의 bottom에서(기준) black의 bottom(inset사용)을 안쪽으로(양수)
            make.bottom.equalTo(view.snp.bottom).inset(50)
            make.width.equalTo(150)
        }
        
        // cyan
        fifthView.snp.makeConstraints { make in
            //MARK : - 각각의 edge에 간격을 주는 두가지 방법
            // 1. 모든 edge에 같은간격을 주고 싶으면 equalToSuperview를 사용하고 .inset(간격)를 넣어준다
            //make.edges.equalToSuperview().inset(40)
            // 2. 각각에 다른 간격을 주고 싶으면 equlTo를 사용하고 input으로 UIEdgeInsets를 넣어준다
            //make.edges.equalTo(UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 50))
            // ✅equalToSuperview를 사용하려면 .inset안에다가 UIEdge를 넣어준다
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 50))
        }
        
        // gray
        sixthView.snp.makeConstraints { make in
            //make.leading.equalTo(thridView.snp.leading).offset(-10)
            
            // trailing이니까 기본적으로 inset을 사용하는데 기준인 초록색의 오른쪽기준으로 바깥쪽이니까 음수
            // 만약에 안쪽으로 넣으려면 양수를 넣으면됨
            make.trailing.equalTo(thridView.snp.trailing).inset(-10)
            make.top.equalTo(thridView.snp.bottom).offset(50)
            make.size.equalTo(50)
        }
    }


}

