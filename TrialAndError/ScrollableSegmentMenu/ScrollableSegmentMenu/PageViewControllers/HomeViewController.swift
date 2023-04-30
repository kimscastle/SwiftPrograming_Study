//
//  HomeViewController.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

import SnapKit

enum Metric {
    static let collectionViewHeight = UIScreen.main.bounds.width * 230 / 151
    static let cellWidth = UIScreen.main.bounds.width
}

class HomeViewController: UIViewController {
    
    let testImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "poster1"))
        view.contentMode = .scaleAspectFit
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(testImageView)
        testImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.greaterThanOrEqualTo(Metric.collectionViewHeight)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
