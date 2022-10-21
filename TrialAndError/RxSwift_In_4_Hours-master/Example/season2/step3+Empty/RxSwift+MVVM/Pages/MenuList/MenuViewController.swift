//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    // MARK: - Life Cycle
    
    let cellId = "MenuItemTableViewCell"
    
    let viewModel = MenuListViewModel()
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.menuObservable
            .bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: MenuItemTableViewCell.self)) { index, item, cell in
                cell.title.text = item.name
                cell.price.text = "\(item.price)"
                cell.count.text = " \(item.count)"
                
                //MARK : - +,- 처리를 해야함
                cell.onChange = { [weak self] increase in
                    self?.viewModel.changeCount(item: item, increase: increase)
                }
            }
            .disposed(by: disposeBag)
        
        viewModel.itemsCount
            .map { "\($0)" }
            // 지금은 observable자체가 main스레드에서 작업을 해서 상관이없지만 ui작업은 메인스레드에서 해야하기때문에 observable이 다른쓰레드에서 작업이 되었다면
            //.observeOn(MainScheduler.instance)
            //MARK : - itemCountLabel.text에 값을 넣어준다
            // subscribe, 순환참조도 없어서 편하다
        
            // 이건 itemVCountLabel.rx.text라는 binder가 받는거라 .bind(to: )
            // binder가 아닌 다른 observabele이 받게 하려면 .bind(onNext {})로 넘겨줘야한다
            .bind(to: itemCountLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.totalPrice
            .map { $0.currencyKR() }
            .bind(to: totalPrice.rx.text)
            .disposed(by: disposeBag)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? ""
        if identifier == "OrderViewController",
            let orderVC = segue.destination as? OrderViewController {
            // TODO: pass selected menus
        }
    }

//    func showAlert(_ title: String, _ message: String) {
//        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
//        present(alertVC, animated: true, completion: nil)
//    }

    // MARK: - InterfaceBuilder Links

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var itemCountLabel: UILabel!
    @IBOutlet var totalPrice: UILabel!

    @IBAction func onClear() {
        viewModel.clearAllItemSelections()
    }

    @IBAction func onOrder(_ sender: UIButton) {
        // TODO: no selection
        // showAlert("Order Fail", "No Orders")
        //performSegue(withIdentifier: "OrderViewController", sender: nil)
        //viewModel.totalPrice += 100
        
        //MARK : - 눌렀을때 값자체는 변하지만 ui에 적용이 안되기때문에 아래 실행문들을 또 가져와야한다 viewDidLoad와 중복되니까 함수로 뺴준다
        // -> 이렇게 하기가 싫다....
        //viewModel.totalPrice.onNext(100)
        //viewModel에 "menuObservable에" 보낸다
        viewModel.onOrder()
        
    }
}
