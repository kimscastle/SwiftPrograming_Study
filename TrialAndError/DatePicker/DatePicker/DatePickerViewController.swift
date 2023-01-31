//
//  ViewController.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit
import SnapKit

final class DatePickerViewController: UIViewController {
    
    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "데이트피커"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        // MARK: - 지울거
        label.backgroundColor = .orange
        return label
    }()
    
    let hundredDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .light)
        let today = Calendar.current.date(byAdding: .day, value: Int.hundred-1, to: Date())
        label.text = DateFormatter().toYearMonthDay(date: today!)
        return label
    }()
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(200)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(hundredDateLabel)
        hundredDateLabel.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    }
    
    private func setDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko_KR")
        datePicker.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
    }
    
    
    /// datePicker의 날짜가 바뀌면 모든 event들이 업데이트 되어야한다
    /// eventManager를 만들어서 changedValue를 넘겨주면 값들이 변하게 함수를 만들어야할듯
    /// 필요한거 1.오늘은 몇일째인가, 2. 100일단위 기념일, 3. 1년단위 기념일
    @objc func datePickerChanged() {
        // MARK: - 오늘을 포함하려면 100일 뒤의 날짜를 100-1일의 날짜로 포함시켜줘야한다
        guard let hundredDate = Calendar.current.date(byAdding: .day, value: Int.hundred - 1, to: datePicker.date - 1) else { return }
        hundredDateLabel.text = DateFormatter().toYearMonthDay(date: hundredDate)
    }
}

extension Int {
    static let hundred = 100
    static let year = 365
}

