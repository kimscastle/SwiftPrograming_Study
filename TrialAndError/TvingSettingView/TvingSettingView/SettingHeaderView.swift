//
//  SettingHeaderView.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

import SnapKit

class SettingHeaderView: UIView {
    
    let profileView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let profileNameView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    let profileChangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let profileCahsInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let profileAdView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(profileView)
        addSubview(profileNameView)
        addSubview(profileChangeView)
        addSubview(profileCahsInfoView)
        addSubview(profileAdView)
        
        
        profileView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(30)
            make.leading.equalToSuperview().inset(30)
            make.size.equalTo(70)
        }

        profileNameView.snp.makeConstraints { make in
            make.leading.equalTo(profileView.snp.trailing).offset(20)
            make.centerY.equalTo(profileView.snp.centerY)
            make.width.equalTo(64)
            make.height.equalTo(22)
        }
        

        profileChangeView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(profileView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(25)
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        profileCahsInfoView.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(90)
        }

        profileAdView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(profileCahsInfoView.snp.bottom).offset(10)
            make.height.equalTo(60)
        }

    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
