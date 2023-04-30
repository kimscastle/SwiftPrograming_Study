//
//  SettingTableViewSectionHeader.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

import SnapKit

class SettingTableViewSectionHeader: UIView {
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        addSubview(line)
        line.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
//            make.top.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
