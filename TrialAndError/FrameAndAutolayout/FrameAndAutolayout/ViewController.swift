//
//  ViewController.swift
//  FrameAndAutolayout
//
//  Created by uiskim on 2022/11/11.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Frame을 잡으면 기본적인 View의 크기와 위치가 정해진다
    let uiView = FrameView(frame: .init(origin: .init(x: 0, y: 0), size: .init(width: 100, height: 100)))
    
    // MARK: - frame을 .zero로 선언하면 frame을 사용하지 않겠다는 뜻(모조건 autoLayout제약조건 추가)
    let noFrameUIView = FrameView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(uiView)
        // MARK: - frame으로 위치가 정해지더라도 autoLayout을 잡으면 최신화가 된다
        // 이떄 autoLayout을 잡으면 frame자체를 지워버리기때문에 조건을 다 잡아줘야한다
        // 크기는 frame으로 잡은 100을 사용해야지 하고 center만 autoLayout으로 잡으면 안된다는 뜻
        uiView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalToSuperview()
        }
        
        view.addSubview(noFrameUIView)
        noFrameUIView.backgroundColor = .blue
        noFrameUIView.snp.makeConstraints { make in
            make.top.equalTo(uiView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.size.equalTo(50)
        }
    }
}

