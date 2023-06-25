//
//  ViewController.swift
//  FloatingButton
//
//  Created by uiskim on 2023/06/25.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {
    
    private let backgroundView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "WeatherBG_Moon"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let floatingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add_icon_green"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin).offset(-40)
            make.trailing.equalToSuperview().inset(40)
            make.size.equalTo(60)
        }
        floatingButton.addTarget(self, action: #selector(floatingButtonTapped), for: .touchUpInside)
    }
    
    @objc func floatingButtonTapped() {
        let nextViewController = FloatingActionViewController()
        nextViewController.modalPresentationStyle = .overCurrentContext
        self.present(nextViewController, animated: false)
    }
}

