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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK : - cell은 updateConstraints에서 레이아웃을 잡아줘야함
    override func updateConstraints() {
        setUI()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.clipsToBounds = true
        //MARK : - 이경우는 cornerRadius가 profileImage의 오토레이아웃이 잡히고 난후에 값을 결정할 수 있기때문에 updataConstraints이후에 넣어줘야한다
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
    
    //MARK : - 여기서 오류가 발생하는 이유는 함수의 파라미터는 let으로 받기 때문이다
    // lazy는 반드시 var로 받아야한다
    // 왜냐하면 이 프로퍼트의 초기값을 인스턴스 초기화가 완료된 시점까지 알 수 없기 때문에 초기값을 결정짓는 let은 사용이 불가능하다
    // 생성자에서 초기화시키지 않기때문에 반드시 초기값이 필요하다
    func makeUI(_ data: Member?) {
        guard var data = data else {return}
        profileImage.image = data.memberImage
        nameLable.text = data.name
        addressLabel.text = data.address
    }
}
