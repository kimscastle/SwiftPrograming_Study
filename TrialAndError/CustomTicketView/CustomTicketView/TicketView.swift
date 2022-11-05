//
//  TicketView.swift
//  CustomTicketView
//
//  Created by uiskim on 2022/11/05.
//

import UIKit

class TicketView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
        layer.cornerRadius = 18
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
