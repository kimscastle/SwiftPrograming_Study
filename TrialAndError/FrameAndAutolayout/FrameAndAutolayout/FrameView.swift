//
//  FrameView.swift
//  FrameAndAutolayout
//
//  Created by uiskim on 2022/11/11.
//

import UIKit

class FrameView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
