//
//  ViewController.swift
//  LottiePractice
//
//  Created by uiskim on 2022/10/14.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let animationView: LottieAnimationView = .init(name: "HomeLottie")
        // Do any additional setup after loading the view.
        view.addSubview(animationView)
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFill

                
        // 애니메이션을 무한으로 실행
        animationView.loopMode = .loop
        animationView.play()
    }


}

