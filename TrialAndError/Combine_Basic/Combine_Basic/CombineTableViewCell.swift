//
//  CombineTableViewCell.swift
//  Combine_Basic
//
//  Created by uiskim on 2022/11/12.
//

import UIKit
import SnapKit

class CombineTableViewCell: UITableViewCell {
    
    static let cellId = "CombineTableViewCell"
    
    var data: Title? {
        didSet {
            title.text = data?.title
        }
    }
    
    let title: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        addSubview(title)
        title.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
