//
//  MemberTableViewCell.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/07.
//

import UIKit
import SnapKit

class MemberTableViewCell: UITableViewCell {
    
    var member: Member? {
        didSet {
            guard var member = member else {return}
            profileImage.image = member.memberImage
            nameLable.text = member.name
            addressLabel.text = member.address
        }
    }
    
    var profileImage: UIImageView = {
        let v = UIImageView()
        return v
    }()
    
    var nameLable: UILabel = {
        let v = UILabel()
        v.font = .boldSystemFont(ofSize: 12)
        return v
    }()
    
    var addressLabel: UILabel = {
        let v = UILabel()
        v.font = .systemFont(ofSize: 10)
        return v
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 5
        sv.addArrangedSubview(nameLable)
        sv.addArrangedSubview(addressLabel)
        return sv
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(profileImage)
        addSubview(stackView)
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : - cell은 updateConstraints에서 레이아웃을 잡아줘야함
//    override func updateConstraints() {
//        super.updateConstraints()
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }
    
    func setUI() {

        profileImage.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        nameLable.snp.makeConstraints { make in
            make.height.equalTo(20)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(profileImage.snp_rightMargin).offset(20)
            make.top.equalTo(profileImage.snp.top)
            make.bottom.equalTo(profileImage.snp.bottom)
            make.right.equalToSuperview()
        }
    }
}
