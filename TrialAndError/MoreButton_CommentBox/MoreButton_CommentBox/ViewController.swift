//
//  ViewController.swift
//  MoreButton_CommentBox
//
//  Created by uiskim on 2022/10/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let reviewTabelView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reviewTabelView.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTabelView.dataSource = self
        reviewTabelView.rowHeight = UITableView.automaticDimension
        setUI()
    }
    
    func setUI() {
        view.addSubview(reviewTabelView)
        reviewTabelView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as! ReviewTableViewCell
        cell.review = reviews[indexPath.row]
        cell.delegate = self
        cell.change = { [weak self] isTapped in
            UIView.animate(withDuration: 0.3) {
                self?.reviewTabelView.beginUpdates()
                self?.reviewTabelView.endUpdates()
            }
        }
        return cell
    }
}

extension ViewController: TapMoreButtonDelegate {
    // 얘는 reload만해주는 delegate
    func moreTapped(cell: ReviewTableViewCell) {
        reviewTabelView.beginUpdates()
        reviewTabelView.endUpdates()
    }
}
