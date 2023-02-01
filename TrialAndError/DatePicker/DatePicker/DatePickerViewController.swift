//
//  ViewController.swift
//  DatePicker
//
//  Created by uiskim on 2023/01/31.
//

import UIKit
import SnapKit

final class DatePickerViewController: UIViewController {
    
    var viewModel = EventViewModel()
    
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
    
    let eventTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        return tableView
    }()
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        let hundred: TimeInterval = -60 * 60 * 24 * 365 * 100
        datePicker.minimumDate = Date(timeIntervalSinceNow: hundred)
        datePicker.maximumDate = Date()
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePicker()
        setUI()
    }

    
    private func setUI() {
        view.backgroundColor = .brown
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(datePicker)
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        eventTableView.dataSource = self
        view.addSubview(eventTableView)
        eventTableView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
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
        eventTableView.reloadData()
        print(datePicker.date)
        // MARK: - 오늘을 포함하려면 100일 뒤의 날짜를 100-1일의 날짜로 포함시켜줘야한다
        viewModel.fetch(seletedDate: datePicker.date).forEach { element in
            print(element.title)
            print("D\(element.count(date: datePicker.date))")
            dump(element.getDateTitle(date: datePicker.date))
            
        }
        
    }
}

extension DatePickerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.fetch(seletedDate: datePicker.date).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = isDateGone(date: viewModel.fetch(seletedDate: datePicker.date)[indexPath.row].count(date: datePicker.date)) ? .lightGray : .blue
        
        
        
        cell.dday.text = ddayTitle(date: viewModel.fetch(seletedDate: datePicker.date)[indexPath.row].count(date: datePicker.date))
        cell.title.text = viewModel.fetch(seletedDate: datePicker.date)[indexPath.row].title
        cell.dateLabel.text = viewModel.fetch(seletedDate: datePicker.date)[indexPath.row].getDateTitle(date: datePicker.date)
        return cell
    }
    
    private func isDateGone(date count: Int) -> Bool {
        return count > 0 ?  true : false
    }
    
    private func ddayTitle(date count: Int) -> String {
        if count == 0 {
            return "오늘"
        } else if count > 0 {
            return "D+\(count)"
        } else {
            return "D\(count)"
        }
    }
}


extension Int {
    static let hundred = 100
    static let year = 365
}

