//
//  TestTableViewCell.swift
//  CellReuseProblem
//
//  Created by uiskim on 2023/02/11.
//

import UIKit
import SnapKit

final class TestTableViewCell: UITableViewCell, TableViewCellRegisterDequeueProtocol {

    //기존방식은 static변수로 직접 cellid나 cellidentifer를 지정해두고(보통은 클래스명이랑 똑같이 만든다)그래야 타입자체의 value값을 넣을 수 있으니까 .self로
    //static let identifier = "TestTableViewCell"
    var inputData: Model? {
        didSet {
            guard let data = inputData else { return }
            nameLabel.text = data.name
            ageLabel.text = String(data.age)
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(ageLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        }
        
        ageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
        
    }
    
}
