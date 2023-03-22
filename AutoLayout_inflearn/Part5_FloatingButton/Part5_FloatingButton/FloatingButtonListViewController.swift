//
//  FloatingButtonListViewController.swift
//  Part5_FloatingButton
//
//  Created by uiskim on 2023/03/22.
//

import UIKit

class FloatingButtonListViewController: UIViewController {
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
    }
    
    // MARK: - Auto Layou을 사용할 때, layoutIfNeeded를 호출하면 변경된 제약을 만족하도록 뷰의 레이아웃이 바뀐다
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 레이아웃의 값들이 변경됨 -> 실제로 ui에 반영은 안되어있는상태
        self.btn1CenterY.constant = 80
        
        // 내가원하는거 : btn1CenterY는 애니메이션 없이 반영하고싶다
        // layoutIfNeeded()를 여기서 호출하면 self.btn1CenterY.contstnat = 80를 업데이트박스에 넣는다
        // 그러면 업데이트박스에있는 self.btn1CenterY.constant = 80을 바로 업데이트 시킨다
        // 그러고나면 업데이트박스는 빈박스가된다
        view.layoutIfNeeded()
        
        
        // 여기서는 업데이트박스에 두개의 변경요소를 넣는거다, 실제로 ui적용이아니라 이렇게 적용시키고싶다는 요청사항이라고 생각하면된다
        self.btn2CenterY.constant = 160
        self.btn3CenterY.constant = 240
        

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            // 지금까지의 변경사항(업데이트박스에있는 요청사항들)을 지금 바로 update(실행)해라 -> 1초간 animation으로해라
            self.view.layoutIfNeeded()
            // MARK: - setNeedsLayout()으로 하면 안됨 -> 얘는 즉시변경이 아니라 다음사이클에서 변경하라고 마킹하는거 그래서 애니메이션이 이상태에서는 변경사항이 없는거
            // 그리고 setNeedsLayour()은 기본적으로 ui를 변경하는 action이 없기때문에 animation블럭이 실행되지않고 바로 끝나버림
            // 그러니까 다음 update사이클이 특정시점에 실행되고 이때 요청사항이 constant의 변경이 한번에 보이게 되는거임
            //self.view.setNeedsLayout()
        } completion: { _ in
            print("끝")
        }
    }
    
    @IBAction func dismissFloating(_ sender: UIButton) {
        self.btn1CenterY.constant = 0
        self.btn2CenterY.constant = 0
        self.btn3CenterY.constant = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
}
