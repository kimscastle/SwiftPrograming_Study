//
//  PopupViewController.swift
//  Part9_PopUpLayout
//
//  Created by uiskim on 2023/03/24.
//

import UIKit

class PopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissButton(_ sender: UIButton) {
        self.dismiss(animated: false)
    }

    @IBAction func checkButtonTapped(_ sender: UIButton) {
        print("버튼이 눌렸습니다")
        self.dismiss(animated: false)
    }
    
}
