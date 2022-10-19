//
//  MenuListViewModel.swift
//  RxSwift+MVVM
//
//  Created by uiskim on 2022/10/18.
//  Copyright © 2022 iamchiwon. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MenuListViewModel {

    lazy var menuObservable = BehaviorSubject<[Menu]>(value: [])
    //데이터를 전달만해주는 놈 구독한사람들한테 전달할 데이터 -> just안에 들어있는 놈
    //근데 이놈이 데이터가 계속 바뀌어서 데이터를 받기도 해야함(observer의 역할도 해야함)
    //데이터를 받는다 -> 어디선가 onNext가 가능하다
    
    lazy var itemsCount = menuObservable.map { $0.map { $0.count }.reduce(0, +) }
    //MARK : - 매번 ui를 업데이트 해주는 코드를 사용하는게 불편하다면??? 변하는 값을 관찰하면된다
    lazy var totalPrice = menuObservable.map { $0.map { $0.price * $0.count }.reduce(0, +) }
    
    init() {
        _ = APIService.fetchAllMenusRx()
            .map { data -> [MenuItem] in
                struct Response: Decodable {
                    let menus: [MenuItem]
                }
                let response = try! JSONDecoder().decode(Response.self, from: data)
                return response.menus
            }
            .map { menuItems -> [Menu] in
                var menus: [Menu] = []
                menuItems.enumerated().forEach { (index, item) in
                    let menu = Menu.fromMenuItems(index: index, item: item)
                    menus.append(menu)
                }
                return menus
            }
            .take(1)
            // binder가 아닌 다른 observabele(여기서는 menuObservable)이 받게 하려면 .bind(onNext {})로 넘겨줘야한다
            // observable이 데이터를 넘겨줬다 -> 그럼 받아야한다 subscribe나 bind로
            // bind로 받아서 데이터를 넘겨줄건데 binder한테 넘겨줄게 아니네? ..rx...가 없네?
            // 그러면 onNext로 넘겨주는데 menuObservable이 subject네? onNext로 데이터를 받을수있는녀석이네?
            // 그럼 .bind(onNext로 넘겨주되 menuObservable.onNext로 데이터를 넘겨줘야겠다
            .bind(onNext: { menus in
                self.menuObservable.onNext(menus)
            })
    }
    
    func clearAllItemSelections() {
        _ = menuObservable
            .map { menus in
                menus.map { menu in
                    return Menu(id: menu.id, name: menu.name, price: menu.price, count: 0)
                }
            }
            .observeOn(MainScheduler.instance)
            .take(1)
            .bind(onNext: { menus in
                self.menuObservable.onNext(menus)
            })
            // 사실 이렇게 바로 없애버리는건 좋지 않음 그렇다고 disposbag을 만들자니 한번쓰고 이 stream이 끊어져야하는데 viewModel자체가 MainViewController가 없어질때까지 유지가 되니까 이걸 그냥 한번만 실행하게 만들자는 의미가 .task(1)이라는 operator
            //.dispose()
    }
    
    func changeCount(item: Menu, increase: Int) {
        _ = menuObservable
            .map { menus in
                menus.map { menu in
                    if menu.id == item.id {
                        //MARK : - 인자를비교해서 큰 값을 return -> max함수
                        return Menu(id: menu.id, name: menu.name, price: menu.price, count: max(menu.count + increase, 0))
                    } else {
                        return Menu(id: menu.id, name: menu.name, price: menu.price, count: menu.count)
                    }
                }
            }
            .take(1)
            .bind(onNext: { menus in
                self.menuObservable.onNext(menus)
            })
    }
    
    func onOrder() {
           
    }
}
