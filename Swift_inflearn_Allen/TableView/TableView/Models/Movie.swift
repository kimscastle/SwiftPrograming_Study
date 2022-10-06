//
//  Moview.swift
//  TableView
//
//  Created by uiskim on 2022/10/06.
//

import UIKit

struct Movie {
    //MARK : - 이미지가 없다면 에러가 발생할 수 있음
    var movieImage: UIImage?
    let movieName: String
    let movieDescription: String
}
