//
//  ViewController.swift
//  Part9_PopUpLayout
//
//  Created by uiskim on 2023/03/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: UIButton) {
        // PopupViewController
        let storyBoard = UIStoryboard(name: String(describing: PopupViewController.self), bundle: nil)
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: true)
    }
}

