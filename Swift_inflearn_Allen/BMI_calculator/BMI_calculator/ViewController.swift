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
        // 넘어갈 viewController가 스토리보드객체인경우 -> 단순인스턴스생성으로는 안됨
        // 스토리보드를 viewcontroller로 바꿔줘야함 그리고 어떤 식별자를 넣어줘야하는데 식별자는 stotyboard에서 직접 설정해줌
        // return은 범용적인 타입인 uiviewcontroller임 -> 그렇기때문에 구체적인 viewcontroller로 타입캐스팅 해줘야함
        // as!로 할거면 상관이 없는데 만약에 as?로 할거면 if let 바인딩이나 guard let바인딩을 사용해줘야함
        // guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? MyViewController else { return }
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? MyViewController {
            // MyViewController객체를 생성한 순간에는 스토리보드객체가 생성되기 전이다(outlet변수를 연결시키기 전임)
            // 코드로 ui를 구성하면 객체를 생성하는 순간에 모든 요소들이 내부에 존재하게되는데
            // 스토리보드로 ui를 구성하게 되면 viewcontroller객체와 storyboard객체가 따로 생기고 이거를 연결해주는 과정이 필요한데 그 과정이 viewdidload에서 실행된다
            // 아래코드가 viewdidload에서 실행되는게 아니기때문에 에러가 발생한다
            //secondVC.mainLabel.text = "아기상어"
            // someString은 viewcontroller 인스턴스가 생성되는 순간에 생기기때문에 이런 접근은 normal하게 가능하다
            secondVC.someString = "아빠상어"
            present(secondVC, animated: true)
        }
    }
    
    //MARK : - 스토리보드에서의 화면이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
    }
    
    
}

