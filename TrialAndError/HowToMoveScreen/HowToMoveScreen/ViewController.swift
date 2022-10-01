//
//  ViewController.swift
//  HowToMoveScreen
//
//  Created by uiskim on 2022/10/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
    @IBAction func storyBoardWithCodeButtonTapped(_ sender: UIButton) {
        // 넘어갈 viewController가 스토리보드객체인경우 -> 단순인스턴스생성으로는 안됨
        // 스토리보드를 viewcontroller로 바꿔줘야함 그리고 어떤 식별자를 넣어줘야하는데 식별자는 stotyboard에서 직접 설정해줌
        // return은 범용적인 타입인 uiviewcontroller임 -> 그렇기때문에 구체적인 viewcontroller로 타입캐스팅 해줘야함
        // as!로 할거면 상관이 없는데 만약에 as?로 할거면 if let 바인딩이나 guard let바인딩을 사용해줘야함
        // guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? MyViewController else { return }
        if let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
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
    // segue[세그웨이] - 화면이동을 담당하는 객체
    @IBAction func storyBoardWithSegueButtonTapped(_ sender: UIButton) {
        // segue를 활성화시켜줘야한다
        // performSegue를 실행시키면 prepare 메서드를 자동으로 실행한다 -> 재정의해서 데이터를 넘겨줘야함
        // sender: self를 하는이유는 근원지(시작 viewcontroller)를 지정해줌
        
        // 직접실행이가능하기때문에(간접 세그웨이에서는) shouldPerformSegue를 실행할 필요가 없음
        // 필요하면 if문으로 직접 분기처리를 해버리면 됨
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // segue방식으로 데이터를 전달하는 방식은 조금 까다롭다
    // 메서드를 통해서 데이터를 전달해야한다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            // segue.destination은 viewcontroller인데 어떤viewcontroller인지를 구체적으로 바꿔줘야함
            // segue를 통해 접근할 viewcontroller를 정의해줘야한다
            let thirdVC = segue.destination as! ThridViewController
            // 이제 데이터를 접근해도됨
            thirdVC.someString = "엄마상어"
        }
        
        //MARK : - 스토리보드에서 버튼을 바로 다음 뷰컨으로 이동시키는 경우
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController
            fourthVC.someString = "뚜루루뚜뚜"
            
        }
    }
    
    //var num = 7 -> 화면안넘어감
    var num = 3
    
    //MARK : - 어떤조건에따라서 bool값을 retrun함
    // 조건에따라 직접segue를 실행할지 말지를 판단해줌
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if num > 5 {
            return false
        } else {
            return true
        }
    }

}

