//
//  ViewController.swift
//  Part5_FloatingButton
//
//  Created by uiskim on 2023/03/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }


}

