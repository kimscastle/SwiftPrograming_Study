//
//  CombineViewModel.swift
//  Combine_Basic
//
//  Created by uiskim on 2022/11/12.
//

import UIKit
import Combine

struct Title {
    let title: String
    let comenet: String
}

final class CombineViewModel {
    @Published var title: [Title] = []
    
    func fetchTitleDatas() {
        title = [
            .init(title: "11", comenet: "코멘트111"),
            .init(title: "22", comenet: "코멘트222"),
            .init(title: "33", comenet: "코멘트333")
        ]
    }
    
    func appendData(data: Title) {
        title.append(data)
    }
}
