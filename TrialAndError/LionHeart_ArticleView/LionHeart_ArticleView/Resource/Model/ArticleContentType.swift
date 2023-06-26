//
//  ArticleContentType.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit.UIImage

enum ArticleContentType {
    case thumbNail(UIImage)
    case title(Header)
    case quote(String)
    case content(String)
    case block(String)
}

struct Header {
    let title: String
    let uploadDate: String
    let publisher: String
}
