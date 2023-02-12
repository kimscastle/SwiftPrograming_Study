//
//  DiffableTableViewCell.swift
//  DiffableDataSource
//
//  Created by uiskim on 2023/02/11.
//

import UIKit
import SnapKit

class DiffableTableViewCell: UITableViewCell, CellReusableProtocol {
    
    var data: Person? {
        didSet {
            guard let person = data else { return }
            nameLabel.text = person.name
            ageLabel.text = String(person.age)
            addressLabel.text = person.address
        }
    }
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
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
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(addressLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        
        ageLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        addressLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
