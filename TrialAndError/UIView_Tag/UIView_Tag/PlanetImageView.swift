//
//  PlanetImageView.swift
//  UIView_Tag
//
//  Created by uiskim on 2022/10/26.
//

import UIKit
import SnapKit

class PlanetImageView: UIView {
    
    var planetData: Dummy? {
        didSet {
            planetImageView.backgroundColor = planetData?.color
            planetLabel.text = planetData?.title
        }
    }
    
    let planetImageView = UIImageView()
    let planetLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        planetLabel.textColor = .black
        addSubview(planetImageView)
        addSubview(planetLabel)
        planetImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        planetLabel.snp.makeConstraints { make in
            make.top.equalTo(planetImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
