//
//  TestViewController.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

class TestViewController: UIViewController {
    
    enum UserSettingType: String, CaseIterable {
        case a = "aaaaa"
        case b = "1:1 문의내역"
        case c = "예약알림"
        case d = "회원정보 수정"
        case e = "프로모션 정보 수신 동의"
    }

    enum AppInfoType: String, CaseIterable {
        case f = "공지사항"
        case g = "이벤트"
        case h = "고객센터"
        case i = "티빙 알아보기"
    }
    
    let data = [UserSettingType.allCases.map {$0.rawValue}, AppInfoType.allCases.map {$0.rawValue}]
    
    let settingView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingView)

        tvingNaviBar(.white, left: [UIImageView(image: UIImage(systemName: "flame"))], right: [], true)
        settingView.sectionFooterHeight = 0
        settingView.separatorStyle = .none
        settingView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.cellId)
        settingView.delegate = self
        settingView.dataSource = self
        settingView.backgroundColor = .black

        settingView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
        

        
        settingView.tableHeaderView = SettingHeaderView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 280))
        settingView.tableFooterView = SettingFooterView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
    }
}


extension TestViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = SettingTableViewSectionHeader()
        return sectionHeader
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.cellId, for: indexPath) as? SettingTableViewCell else { return SettingTableViewCell()}
        cell.label.text = data[indexPath.section][indexPath.row]
        return cell
    }
}



