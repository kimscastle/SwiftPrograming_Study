//
//  ReviewTableViewCell.swift
//  MoreButton_CommentBox
//
//  Created by uiskim on 2022/10/22.
//

import UIKit
import SnapKit

protocol TapMoreButtonDelegate {
    func moreTapped(cell: ReviewTableViewCell)
}

class ReviewTableViewCell: UITableViewCell {

    var review: Review? {
        didSet {
            guard let review = review else {return}
            nickNameLabel.text = review.name
            starPoint.text = review.point
            reviewUploadDate.text = review.date
            content.text = review.content
            if (content.text as! NSString).size().width < 300 {
                moreButton.isHidden = true
            }
        }
    }
    
    var delegate: TapMoreButtonDelegate?
    static let identifier = "ReviewTableViewCell"
    var isExpanded: Bool = false
    
    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    let starPoint: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    let reviewUploadDate: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    let content: UILabel = {
        let content = UILabel()
        content.font = .systemFont(ofSize: 10, weight: .regular)
        content.numberOfLines = 2
        return content
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.orange, for: .normal)
        button.setTitle("Read more", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .medium)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nickNameLabel)
        contentView.addSubview(starPoint)
        contentView.addSubview(reviewUploadDate)
        contentView.addSubview(content)
        contentView.addSubview(moreButton)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setUI () {
        
        nickNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(10)

        }
        
        starPoint.snp.makeConstraints { make in
            make.top.equalTo(nickNameLabel.snp.top)
            make.left.equalTo(nickNameLabel.snp.right).offset(10)

        }
        
        reviewUploadDate.snp.makeConstraints { make in
            make.top.equalTo(nickNameLabel.snp.top)
            make.right.equalToSuperview().inset(10)

        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(nickNameLabel.snp.bottom).offset(20)
            make.left.equalTo(nickNameLabel.snp.left)
            make.right.equalToSuperview().inset(90)
            make.bottom.equalToSuperview().inset(10)

        }
        
        moreButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalTo(reviewUploadDate.snp.right)
        }
        
    }
    
    var change: ((Bool) -> Void)?
    
    //MARK : - 이미 numberOfLines라는 속성의 값은 바뀌었는데 이걸 적용을 해줘야해 그걸 reload라고하는데 그건 viewController만 할수있어
    // -> 대리자 설정해주자 (1)delegate (2)closer
    @objc func moreButtonTapped() {
        isExpanded.toggle()
        moreButton.setTitle(isExpanded ? "Read less" : "Read more", for: .normal)
        content.numberOfLines = isExpanded ? 0 : 2
        
        //MARK : - custom delegate를 이용하는 방법
        //delegate?.moreTapped(cell: self)
        
        //MARK : - closer를 이용하는 방법
        change?(isExpanded)
    }
}
