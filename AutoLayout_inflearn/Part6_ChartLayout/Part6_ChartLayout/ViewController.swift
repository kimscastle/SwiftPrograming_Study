//
//  ViewController.swift
//  Part6_ChartLayout
//
//  Created by uiskim on 2023/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    let testView = UIView()
    let chartView = UIView()
    
    lazy var heigtAnchor = chartView.heightAnchor.constraint(equalTo: testView.heightAnchor, multiplier: 1)


    override func viewDidLoad() {
        super.viewDidLoad()
        testView.backgroundColor = .red
        view.addSubview(testView)
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        testView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        testView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        testView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        testView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        testView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        testView.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.backgroundColor = .blue
        chartView.leadingAnchor.constraint(equalTo: testView.leadingAnchor).isActive = true
        chartView.trailingAnchor.constraint(equalTo: testView.trailingAnchor).isActive = true
        chartView.bottomAnchor.constraint(equalTo: testView.bottomAnchor).isActive = true
//        chartView.heightAnchor.constraint(equalTo: testView.heightAnchor, multiplier: 1).isActive = true
        heigtAnchor.isActive = true

    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        heigtAnchor = heigtAnchor.changeMultiplier(value: 0.8)
        UIView.animate(withDuration: 1) {
            self.view.layoutIfNeeded()
        }
    }
}

extension NSLayoutConstraint {
    func changeMultiplier(value: CGFloat) -> NSLayoutConstraint {
        // MARK: - 2. constraint는 계속해서 추가되는 개념임 원래 인스턴스가 가지고있던 값에다가 새로만든 값이 추가되는 개념
        // 기존에 있던 constraint를 비활성화 시켜야함
        NSLayoutConstraint.deactivate([self])
        
        // MARK: - 1. 새로운 객체를 만들기만 했을뿐 뭐가 실행되거나 그런건아님
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem,
                                                    attribute: self.firstAttribute,
                                                    relatedBy: self.relation,
                                                    toItem: self.secondItem,
                                                    attribute: self.secondAttribute,
                                                    multiplier: value,
                                                    constant: self.constant)
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        // 새로만든걸 활성화 시켜야함
        // 이게 없으면 .isActive = true를 해줘야함
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

