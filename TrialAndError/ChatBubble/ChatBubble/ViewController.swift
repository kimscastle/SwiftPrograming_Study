//
//  ViewController.swift
//  ChatBubble
//
//  Created by uiskim on 2023/02/27.
//

import UIKit

import SnapKit

class ViewController: UIViewController {

    let label: UILabel = {
        let v = UILabel()
        v.text = "ggggasfsfsafadfsaffadsfksjfsjofjoejofjeojwojefiwjeojfowejfojfowiejfowejfowjefojowjfoewjfowjefoiwㅁㄴㄹㄴㅁㄹㄴㅁㄹㄴㅁㄹㅁㄴ"
        v.font = .systemFont(ofSize: 20, weight: .bold)
        v.textAlignment = .left
        v.backgroundColor = .red
        v.numberOfLines = 0
        return v
    }()
    
    let timeLabel: UILabel = {
        let v = UILabel()
        v.text = "2월27일"
        v.font = .systemFont(ofSize: 15, weight: .light)
        v.textAlignment = .left
        return v
    }()
    
    let testLabel: UILabel = {
        let v = UILabel()
        v.text = "tstestLabeltestLabeltestLabel"
        v.font = .systemFont(ofSize: 15, weight: .bold)
        v.textAlignment = .left
        v.backgroundColor = .blue
        return v
    }()
    
    let testTimeLabel: UILabel = {
        let v = UILabel()
        v.text = "test"
        v.font = .systemFont(ofSize: 10, weight: .light)
        v.textAlignment = .left
        v.backgroundColor = .brown
        v.textColor = .white
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        label.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .vertical)
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualToSuperview().inset(50)
        }
        
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.trailing)
            make.bottom.equalTo(label.snp.bottom)
        }
        
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.leading)
            make.top.equalTo(label.snp.bottom).offset(100)
        }
        
        view.addSubview(testTimeLabel)
        testTimeLabel.snp.makeConstraints { make in
            make.leading.equalTo(testLabel.snp.trailing)
            make.bottom.equalTo(testLabel.snp.bottom)
        }
    }


}

