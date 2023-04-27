//
//  CustomNavigationView.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

import SnapKit

class CustomNavigationView: UIView {

    let backButtonView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.left")
        view.tintColor = .white
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let alertImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "alarm")
        view.tintColor = .gray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    init() {
        super.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        backgroundColor = .black
        addSubview(backButtonView)
        backButtonView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(60)
            make.size.equalTo(25)
        }
        
        addSubview(alertImage)
        alertImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(60)
            make.size.equalTo(25)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
