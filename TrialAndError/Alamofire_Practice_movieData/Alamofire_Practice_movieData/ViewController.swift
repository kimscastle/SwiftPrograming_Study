//
//  ViewController.swift
//  Alamofire_Practice_movieData
//
//  Created by uiskim on 2023/05/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: .init(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Tap Me", for: .normal)
        button.center = view.center
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        ApiService.shared.fetchMovie { movies in
            dump(movies)
        }
        
    }


}

