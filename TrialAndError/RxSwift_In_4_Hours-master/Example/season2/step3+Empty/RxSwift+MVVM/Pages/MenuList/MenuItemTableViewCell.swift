//
//  MenuItemTableViewCell.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 07/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    @IBOutlet var price: UILabel!
    
    var onChange: ((Int) -> Void)?

    @IBAction func onIncreaseCount() {
        print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
        onChange?(1)
        print("✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅✅")
        // onChange를 그냥쓰는건 함수를 가리키는거
        // onChange(1)은 input에 1을 넣고 함수를 실행시키는거
        // 근데 어떤함수인데????? 그건 모름 그냥 input에 넣었고 어떤함수인지는 알려줘라고 이야기할수있게됨
    }

    @IBAction func onDecreaseCount() {
        onChange?(-1)
    }
}
