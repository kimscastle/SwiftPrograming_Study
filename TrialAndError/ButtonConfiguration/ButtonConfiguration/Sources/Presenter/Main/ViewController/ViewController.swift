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
        case a
        case b
        case c
        
        var backgroundColor: UIColor? {
            switch self {
            case .a:
                return .blue
            case .b:
                return .black
            case .c:
                return .red
            }
        }
        
        var foregroundColor: UIColor? {
            switch self {
            case .a:
                return .brown
            case .b:
                return .green
            case .c:
                return .white
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
