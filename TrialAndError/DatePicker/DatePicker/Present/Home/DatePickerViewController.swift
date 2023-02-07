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
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = DateFormatter().toYearMonthDay(date: LocalStorageManger.shared.readDate())
        return label
    }()
    
    let changeDateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setButtonSetting(title: "만난날짜 변경하기", textColor: .blue, fontSize: 20, fontWeight: .bold)
        button.addTarget(self, action: #selector(changeDateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func changeDateButtonTapped() {
        let alert = UIAlertController(title: "날짜 고르기", message: "날짜를 골라주세요", preferredStyle: .actionSheet)
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ko_KR")
        let hundred: TimeInterval = -60 * 60 * 24 * 365 * 100
        datePicker.minimumDate = Date(timeIntervalSinceNow: hundred)
        datePicker.maximumDate = Date()
        datePicker.date = LocalStorageManger.shared.readDate()
                
        let ok = UIAlertAction(title: "선택 완료", style: .cancel) { action in
            LocalStorageManger.shared.setDate(date: datePicker.date)
            self.mainLabel.text = DateFormatter().toYearMonthDay(date: datePicker.date)
            self.viewModel.dateFetch()
            self.eventTableView.reloadData()
        }
        alert.addAction(ok)
        let vc = UIViewController()
        vc.view = datePicker
        alert.setValue(vc, forKey: "contentViewController")
        present(alert, animated: true)
    }
        
    let eventTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dateFetch()
        setUI()
    }

    
    private func setUI() {
        view.backgroundColor = .brown
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalToSuperview().inset(50)
        }
    
        view.addSubview(changeDateButton)
        changeDateButton.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        eventTableView.dataSource = self
        view.addSubview(eventTableView)
        eventTableView.snp.makeConstraints { make in
            make.top.equalTo(changeDateButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension DatePickerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else { return UITableViewCell() }
        cell.data = viewModel.events[indexPath.row]
        return cell
    }
}
