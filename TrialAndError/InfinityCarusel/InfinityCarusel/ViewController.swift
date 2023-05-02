//
//  ViewController.swift
//  InfinityCarusel
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

class ViewController: UIViewController {
    
    let aa = CarouselView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 600))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(aa)
    }


}

