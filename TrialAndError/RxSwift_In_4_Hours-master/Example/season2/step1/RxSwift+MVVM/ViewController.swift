//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }

    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }

    // MARK: SYNC

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        
        //MARK : - 첫번째 방법(URLSesseion)
        // ui를 건드리는 부분(text를 수정한다던가 animation을 사용한다던가)은 main에서 진행해야한다
//        editView.text = ""
//        setVisibleWithAnimation(activityIndicator, true) //이걸 urlsession에 넣으면 에러발생
//        let url = URL(string: MEMBER_LIST_URL)!
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data = data else {return}
//            let json = String(data: data, encoding: .utf8)
//            // ui작업은 다시 main에서 작업할 수 있게
//            DispatchQueue.main.async {
//                self.editView.text = json
//                self.setVisibleWithAnimation(self.activityIndicator, false)
//            }
//        }.resume()  // 빼먹으면 안됨
        
        //MARK : - 두번째 방법(DispatchQueue)
        editView.text = ""
        setVisibleWithAnimation(activityIndicator, true)
        DispatchQueue.global().async {
            let url = URL(string: MEMBER_LIST_URL)
            guard let url = url else {return}
            let data = try! Data(contentsOf: url)
            let json = String(data: data, encoding: .utf8)
            
            DispatchQueue.main.async { [weak self] in
                self?.editView.text = json
                self?.setVisibleWithAnimation(self?.activityIndicator, false)
            }
        }
    }
}
