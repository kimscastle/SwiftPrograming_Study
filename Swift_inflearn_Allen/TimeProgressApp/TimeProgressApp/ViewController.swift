//
//  ViewController.swift
//  TimeProgressApp
//
//  Created by uiskim on 2022/09/21.
//

import UIKit
// 소리를 나게해주는 라이브러리
import AVFoundation

class ViewController: UIViewController {


    @IBOutlet weak var mainLabel: UILabel!
    // reset버튼을 누르면 가운데로 와야함
    @IBOutlet weak var slider: UISlider!
        
    weak var timer: Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        // 슬라이더의 가운데 설정
        // 기본적인 슬라이더의 value는 0~1인거같음
        // slider.setValue(0.5, animated: true)
        slider.value = 0.5
    }

    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 value값을 가지고 mainLabel에 텍스트를 세팅
        // 정수형으로 바꾸면 소수점은 버림처리
        // 실제 value는 0~1인데 그걸 60을 곱해서 0~60처럼 보이게 세팅
        let seconds = Int(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        // 1초씩 지나갈때마다 무언가를 실행
         timer?.invalidate()
        // 객체 내에서 클로저를 사용할때는 변수에 self를 붙여줘야함
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            // 반복을 하고 싶은 코드
            if number > 0 {
                number -= 1
                // 숫자를 계산해서 넣어줘야함
                // 슬라이더의 위치도 바뀌어야함
                slider.value = Float(number) / Float(60)
                // 레이블표시도 다시 해줘야 함
                mainLabel.text = "\(number) 초"
                
            } else {
                number = 0
                mainLabel.text = "초를 선택하세요"
                timer?.invalidate()
                
                // 소리를 나게 해야함
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 세팅
        // 슬라이더의 가운데 설정, mainLabel에 텍스트를 세팅
        slider.value = 0.5
        mainLabel.text = "초를 선택하세요"
        number = 0
        timer?.invalidate()
        // timer = nil
    }
    
}

