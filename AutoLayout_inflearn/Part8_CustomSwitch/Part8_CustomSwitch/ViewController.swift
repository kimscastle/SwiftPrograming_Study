//
//  ViewController.swift
//  Part8_CustomSwitch
//
//  Created by uiskim on 2023/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchView: UIView!
    @IBOutlet weak var switchCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        switchBtn.layer.cornerRadius = switchBtn.bounds.height/2
        switchView.layer.cornerRadius = switchView.bounds.height/2
    }

    @IBAction func selectedButton(_ sender: UIButton) {
        let leftMaxWidth = CGFloat.getDistance(firstItem: switchView.bounds.width, SecondItem: switchBtn.bounds.width)
        
        switchCenterX.constant = switchCenterX.constant == leftMaxWidth ? -leftMaxWidth : leftMaxWidth
        switchView.backgroundColor = switchCenterX.constant == leftMaxWidth ? UIColor.yellow : UIColor.blue
        
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
}

extension CGFloat {
    static func getDistance(firstItem: CGFloat, SecondItem: CGFloat) -> CGFloat {
        return (firstItem/2)-(SecondItem/2)
    }
}
