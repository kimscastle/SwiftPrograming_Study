//
//  KidViewController.swift
//  ScrollableSegmentMenu
//
//  Created by uiskim on 2023/04/30.
//

import UIKit

class KidViewController: UIViewController {

    let testImageView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "poster2"))
        view.contentMode = .scaleAspectFit
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
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
