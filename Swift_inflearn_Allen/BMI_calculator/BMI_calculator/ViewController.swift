//
//  ViewController.swift
//  BMI_calculator
//
//  Created by uiskim on 2022/09/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK : - 코드로 화면이동(다음화면이 코드로 작성되어있을때 사용)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        // 1.넘어갈 화면을 선언해준다
        let firstVC = FirstViewController()
        
        // 보통 다음뷰에서 데이터를 받기위한 변수에다가 데이터를 넘겨준다
        firstVC.someString = "아기상어"
        
        // 아래같은 방식으로는 잘 사용하지 않는다(직접적으로 레이블에 접근하는 방식은 잘 사용하지 않는다)
        // 다음뷰가 스토리보드라면 이런 방식은 불가능한 접근법이다 
        //firstVC.mainLabel.text = "아기상어"
        
        // 1-1.어떻게 넘어갈지를 선택해줄 수 있다
        firstVC.modalPresentationStyle = .fullScreen
        
        // 2.이동하는 코드는 uiviewcontroller에 이미 구현이 되어있다 -> present
        // completion은 보통 nil이기때문에 생략도 가능
        present(firstVC, animated: true)
    }
    
    //MARK : - 코드로 스토리보드 객체를 생성해서 화면이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
    }
    
    //MARK : - 스토리보드에서의 화면이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
    }
    
    
}

