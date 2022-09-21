//
//  ViewController.swift
//  UpDownGame
//
//  Created by uiskim on 2022/09/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var comNumber = Int.random(in: 1...10) // 1이상 10이하
    // var myNumber: Int = 1
    
    
    // 앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 메인레이블에 "선택하세요"
        mainLabel.text = "선택하세요"
        // 2) 숫자레이블은 ""(빈 문자열)
        numberLabel.text = ""
        // 3) 컴퓨터가 랜덤 숫자를 선택하게 해야함
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야함
        guard let numString = sender.currentTitle else { return }
        
        // 2) 숫자 레이블이 변하도록 (숫자에 따라)
        numberLabel.text = numString
        
        // 3) 선택한 숫자를 변수에다가 저장 (선택)
        // guard let num = Int(numString) else { return }
        // myNumber = num
        
        // 내가 선택한 숫자는 numberLabel에 저장이 되어있음
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 또 다른 방법
        // numberLabel.text는 get함수로도 사용할 수 있다
        // 숫자레이블에 있는 문자열 가져오기(옵셔널 벗기기)
        guard let myNumString = numberLabel.text else { return }
        // 타입변환(옵셔널 벗기기)
        guard let myNumber = Int(myNumString) else { return }
        
        // 1) 컴퓨터의 숫자와 내가선택한 숫자를 비교해서 Up인지 Down인지 Bingo인지를 (main Label)에 표시
        if comNumber > myNumber {
            mainLabel.text = "Up"
        } else if comNumber < myNumber {
            mainLabel.text = "Down"
        } else {
            mainLabel.text = "Bingo!"
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 메인레이블이 "선택하세요"
        mainLabel.text = "선택하세요"
        // 2) 컴퓨터의 랜덤숫자를 다시 선택하게
        comNumber = Int.random(in: 1...10)
        // 3) 숫자레이블을 ""(빈문자열)로 세팅
        numberLabel.text = ""
    }
}

