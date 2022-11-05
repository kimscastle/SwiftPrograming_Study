//
//  ViewController.swift
//  CustomTicketView
//
//  Created by uiskim on 2022/11/05.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let ticketView = TicketView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(ticketView)
        ticketView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(view.frame.width-100)
            make.height.equalTo(view.frame.height-200)
        }
    }
}

