//
//  HeaderSupplementaryView.swift
//  CompositionalLayout
//
//  Created by uiskim on 2023/05/01.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    static var viewId = "HeaderSupplementaryView"
    
    var isFirst: Bool = false {
        didSet {
            guard isFirst == true else { return }
            setHeaderView()
        }
    }
    
    lazy var uiview = CarouselView()
    
    
    var aa: UILabel = {
        let aa = UILabel()
        aa.textColor = .white
        return aa
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(aa)
        aa.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeaderView() {

        addSubview(uiview)
        uiview.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Metric.collectionViewHeight)
        }

        aa.snp.remakeConstraints { make in
            make.leading.equalToSuperview()
            make.height.equalTo(20)
            make.bottom.equalToSuperview()
        }
    }
}
