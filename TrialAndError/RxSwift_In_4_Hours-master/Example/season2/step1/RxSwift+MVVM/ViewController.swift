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
    
    //MARK : - @escaping은 함수 타입앞에 넣어준다
    // completion이 optional인경우 escaping이 default라서 @escaping키워드 불필요
//    func downloadJson(_ url: String, _ completion: @escaping (String?) -> Void){
//        DispatchQueue.global().async {
//            guard let url = URL(string: url) else { return }
//            let data = try! Data(contentsOf: url)
//            let json = String(data: data, encoding: .utf8)
//            DispatchQueue.main.async {
//                // optional이면 completion?(json)
//                completion(json)
//            }
//        }
//    }
    
    
    //MARK : - Observable뜻은 "나중에생기는데이터"
//    func downloadJson(_ url: String) -> Observable<String?> {
//        // 1.비동기로 생기는 데이터를 observable로 감싸서 리턴하는방법
//        return Observable.create { emitter in
//            DispatchQueue.global().async {
//                guard let url = URL(string: url) else { return }
//                let data = try! Data(contentsOf: url)
//                let json = String(data: data, encoding: .utf8)
//                DispatchQueue.main.async {
//                    // "나중에생기는데이터"는 json이다
//                    // 나중에 생기는 데이터를 여기서 처리하겠다
//                    emitter.onNext(json)
//                    //MARK : - 클로저가 지워져서 강한순환참조를 막을 수 있다 .subscribe에서 weak self를 사용하지 않아도 되는 이유
//                    emitter.onCompleted()
//                }
//            }
//            //MARK : - Observable.create()는 return이 Disposables이다
//            return Disposables.create()
//        }
//    }
    
    func downloadJson(_ url: String) -> Observable<String?> {
        return Observable.create { emitter in
            let url = URL(string: MEMBER_LIST_URL)!
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard error == nil else {
                    emitter.onError(error!)
                    return
                }
                
                guard let data = data, let json = String(data: data, encoding: .utf8) else { return }
                emitter.onNext(json)
                emitter.onCompleted()

            }.resume()
            
            return Disposables.create()
        }
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
        // 2.observable로 오는 데이터를 받아서 처리하는 방법
        let observable = downloadJson(MEMBER_LIST_URL)
            //MARK : - .subscribe의 뜻은 "나중에오면" -> "나중에생기는데이터"는 json
        observable.subscribe { event in
            switch event {
            case .next(let json):
                DispatchQueue.main.async { [weak self] in
                    self?.editView.text = json
                    self?.setVisibleWithAnimation(self?.activityIndicator, false)
                }
            case .completed:
                break
            case .error(let error):
                print("\(error)")
            }
        }
    }
}
