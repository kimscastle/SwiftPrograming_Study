//
//  ViewController.swift
//  UIView_Tag
//
//  Created by uiskim on 2022/10/25.
//

import UIKit

struct Dummy {
    let color: UIColor
    let title: String
    let date: String
}



class ViewController: UIViewController {
    
    var xOffset: CGFloat = 20
    var buttonPadding = 50
    
    var dummyDatas = [
        Dummy(color: .red, title: "1", date: "2022/1/1"),
        Dummy(color: .blue, title: "2", date: "2022/2/2"),
        Dummy(color: .green, title: "3", date: "2022/3/3"),
        Dummy(color: .brown, title: "4", date: "2022/4/4")
    ]
    
//    var colors: [UIColor] = [.red, .green, .blue, .yellow]
    var loction: [CGPoint] = [
        CGPoint(x: 50, y: 100),
        CGPoint(x: 150, y: 300),
        CGPoint(x: 120, y: 130),
        CGPoint(x: 100, y: 400)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        for i in dummyDatas.indices {
            let productView = PlanetImageView()
            productView.planetData = dummyDatas[i]
            productView.tag = i
            productView.isUserInteractionEnabled = true
            let producttap = UITapGestureRecognizer(target: self, action: #selector(self.ProductTapped(_:)))
            productView.addGestureRecognizer(producttap)
            productView.frame = CGRect(x: loction[i].x, y: loction[i].y, width: 65, height: 65)
            view.addSubview(productView)
        }
    }
    
    @objc func ProductTapped(_ sender: UITapGestureRecognizer) {
        guard let view = sender.view else { return }
        let nextVC = DetailViewController()
        nextVC.dummy = dummyDatas[view.tag]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

