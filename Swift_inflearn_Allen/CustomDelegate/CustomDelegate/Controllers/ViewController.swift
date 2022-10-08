//
//  ViewController.swift
//  CustomDelegate
//
//  Created by uiskim on 2022/10/06.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    //MARK : - 외부에서 선언하는 경우 lazy로 선언안해주면 self가 선언되기 전이기때문에 target이 호출되지 않는다
//    lazy var plusButton: UIBarButtonItem = {
//        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
//        return button
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setNavigation()
        setUpTableview()
        setData()
    }
    
    //MARK : - 화면이 나타날때마다(사실은 나타나기직전) 함수를 실행시키는 함수
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setNavigation() {
        title = "프로필"
        let appearnce = UINavigationBarAppearance()
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        appearnce.backgroundColor = .lightGray
        navigationController?.navigationBar.scrollEdgeAppearance = appearnce
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setUpTableview() {
        tableView.rowHeight = 70
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MemberTableViewCell.self, forCellReuseIdentifier: "MemberTableViewCell")
    }
    
    func setData() {
        memberListManager.makeMemberListData()
    }
    
    @objc func plusButtonTapped() {
        print("추가하기 버튼이 눌렸습니다")
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell", for: indexPath) as! MemberTableViewCell
        cell.member = memberListManager.getMembersList()[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = DetailViewController()
        let member = memberListManager.getMembersList()[indexPath.row]
        //MARK : - DetailViewController에 member를 전달하는방식(DetailVC의 member를 detailView의 member에 전달을 또해줘야한다
        nextVC.member = member
        
        //MARK : - DetailViewController를 거쳐 바로 DetailView의 member로 접근하는 방법
        //nextVC.detailView.member = member
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

