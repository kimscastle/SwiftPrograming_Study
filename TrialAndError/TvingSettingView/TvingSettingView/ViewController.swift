//
//  ViewController.swift
//  TvingSettingView
//
//  Created by uiskim on 2023/04/27.
//

import UIKit

import SnapKit



class ViewController: UIViewController {
    
    enum UserSettingType: String, CaseIterable {
        case a = "이용권"
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
    
    let customNavigationBar = CustomNavigationView()
    
    let data = [UserSettingType.allCases.map {$0.rawValue}, AppInfoType.allCases.map {$0.rawValue}]
    
    let settingView = UITableView(frame: .zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(settingView)

        tvingNaviBar(.white, left: [UIImageView(image: UIImage(systemName: "flame"))], right: [])
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
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

extension UIViewController {
    func tvingNaviBar<T: UIView, A: UIView>(backgroundColor: UIColor = .black, _ tintColor: UIColor, left leftItems: [T], right rightItems: [A]) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationController?.navigationBar.tintColor = tintColor
        self.navigationItem.setLeftBarButtonItems(leftItems.map {UIBarButtonItem(customView: $0)}, animated: false)
        self.navigationItem.setRightBarButtonItems(rightItems.map {UIBarButtonItem(customView: $0)}, animated: false)
    }
}

typealias ButtonAction = (UIButton) -> Void

extension UIControl {
    func addButtonAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping ButtonAction) {
        @objc class ClosureSleeve: NSObject {
            let closure: ButtonAction
            
            init(_ closure: @escaping ButtonAction) {
                self.closure = closure
            }
            
            @objc func invoke(_ sender: UIButton) {
                closure(sender)
            }
        }
        
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke(_:)), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
}

extension UIButton {
    enum ButtonImageType {
        case back
        case alarm
        case gear
        
        var buttonImage: UIImage? {
            switch self {
            case .alarm:
                return UIImage(systemName: "alarm")
            case .back:
                return UIImage(systemName: "chevron.backward")
            case .gear:
                return UIImage(systemName: "gear")
            }
        }
    }
    
    static func imageButton(_ type: ButtonImageType, closure: @escaping ButtonAction) -> UIButton {
        let button = UIButton(type: .system)
        button.setImage(type.buttonImage, for: .normal)
        button.addButtonAction(closure)
        return button
    }
}


extension UITableView {
    func sizeHeaderToFit() {
        guard let headerView = tableHeaderView else { return }
        
        let newHeight = headerView.systemLayoutSizeFitting(CGSize(width: frame.width, height: .greatestFiniteMagnitude), withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        var frame = headerView.frame
        
        // avoids infinite loop!
        if newHeight.height != frame.height {
            frame.size.height = newHeight.height
            headerView.frame = frame
            tableHeaderView = headerView
        }
    }
}

