//
//  EventTableViewCell.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit
import SnapKit

class EventTableViewCell: UITableViewCell, CellReuseProcotol {
    
    static let identifier = "EventTableViewCell"
    
    var data: Event? {
        didSet {
            guard let data = data else { return }
            dday.text = makeDdayLabel(with: data.count())
            title.text = data.title
            dateLabel.text = data.getDateTitle(date: LocalStorageManger.shared.readDate())
            configureCell(with: data)
            
        }
    }
    
    private func configureCell(with input: Event) {
        //오늘이전 이벤트는 조금 흐리게 만들기
        title.textColor = input.count() > 0 ? .lightGray : .black
        dday.textColor = input.count() > 0 ? .lightGray : .black
        dateLabel.textColor = input.count() > 0 ? .lightGray : .black
    }
    
    private func makeDdayLabel(with dayCount: Int) -> String {
        if dayCount == 0 {
            return "오늘"
        } else if dayCount > 0 {
            return "D+\(dayCount)"
        } else {
            return "D\(dayCount)"
        }
    }
    
    //100일 1주년 등등
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    //며칠남았는지Dday로 보여줌
    var dday: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    //그날짜가 언제인지를 알려줌
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
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
        addSubview(dday)
        addSubview(dateLabel)
        
        title.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        dday.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(dday.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
}
