//
//  ViewController.swift
//  ButtonConfiguration
//
//  Created by uiskim on 2023/02/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var configuration: UIButton.Configuration = {
        var config = UIButton.Configuration.tinted()
        config.title = "test3button"
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .blue
        config.cornerStyle = .capsule
        return config
    }()
    lazy var test1Button = UIButton(configuration: .tinted())
    lazy var test2Button = UIButton(configuration: .customStyle(style: .sub, title: "test2button"))
    lazy var test3Button = UIButton(configuration: configuration)
    
    lazy var test4Button: UIButton = {
        let button = UIButton(configuration: .customStyle(style: .basic, title: "test4button"))
        button.addTarget(self, action: #selector(test4ButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func test4ButtonTapped() {
        print("test4ButtonTapped")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(test1Button)
        test1Button.setTitle("test1button", for: .normal)
        test1Button.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(test2Button)
        test2Button.snp.makeConstraints { make in
            make.top.equalTo(test1Button.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(test3Button)
        test3Button.snp.makeConstraints { make in
            make.top.equalTo(test2Button.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
        
        view.addSubview(test4Button)
        test4Button.snp.makeConstraints { make in
            make.top.equalTo(test3Button.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }

    }
}

extension UIButton.Configuration {
    
    enum CustomButtonStyle {
        case basic
        case sub
        case disabled
        
        var backgroundColor: UIColor? {
            switch self {
            case .basic:
                return UIColor(red: 24/255, green: 206/255, blue: 198/255, alpha: 1.0)
            case .sub:
                return UIColor(red: 228/255, green: 246/255, blue: 246/255, alpha: 1.0)
            case .disabled:
                return UIColor(red: 227/255, green: 232/255, blue: 235/255, alpha: 1.0)
            }
        }
        
        var foregroundColor: UIColor? {
            switch self {
            case .basic:
                return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
            case .sub:
                return UIColor(red: 0/255, green: 171/255, blue: 182/255, alpha: 1.0)
            case .disabled:
                return UIColor(red: 161/255, green: 169/255, blue: 174/255, alpha: 1.0)
            }
        }
    }
    
    static func customStyle(style: CustomButtonStyle, title: String) -> UIButton.Configuration {
        var configuration = UIButton.Configuration.filled()
        configuration.title = title
        configuration.titleAlignment = .center
        configuration.baseForegroundColor = style.foregroundColor
        configuration.baseBackgroundColor = style.backgroundColor
        configuration.background.cornerRadius = 20
        return configuration
    }
}
