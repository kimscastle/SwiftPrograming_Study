//
//  ViewModel.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit

class ViewModel {
    var isLoad: Bool = false
    
    // viewModel에 접근해서 imageUrls를 바꿀수있는 가능성 때문에 private으로 선언
    private var imageUrls = [String]()
    
    func fetchImageUrls() {
        imageUrls = ["https://cdn.pixabay.com/photo/2023/01/23/09/26/cat-7738210_960_720.jpg",
                     "https://cdn.pixabay.com/photo/2022/11/20/09/06/night-view-7603847_960_720.jpg",
                     "https://cdn.pixabay.com/photo/2020/05/19/10/05/opel-5190050_960_720.jpg",
                     "https://cdn.pixabay.com/photo/2017/09/07/08/54/money-2724241_960_720.jpg",
                     "https://cdn.pixabay.com/photo/2014/10/23/10/10/dollars-499481_960_720.jpg"
        ]
    }
    
    // imageUrls를 얻고 싶다면 해당 메서드로 얻게끔 설계
    func getImageUrls() -> [String] {
        return imageUrls
    }
}
