//
//  Poster.swift
//  CollectionViewSection
//
//  Created by uiskim on 2023/06/20.
//

import UIKit

enum DisplayContent {
    case song([Poster])
    case book([Poster])
    case movie([Poster])
}

extension DisplayContent {
    var title: String {
        switch self {
        case .song:
            return "제가 좋아하는 노래를 소개합니다"
        case .book:
            return "제가 좋아하는 책을 소개합니다"
        case .movie:
            return "제가 좋아하는 영화를 소개합니다"
        }
    }
    
    var items: [Poster] {
        switch self {
        case .song(let array), .book(let array), .movie(let array):
            return array
        }
    }
    
    var counts: Int {
        items.count
    }
    
    var cellSize: CGSize {
        switch self {
        case .song(_):
            return .init(width: 300/3, height: 300/3)
        case .book(_), .movie(_):
            return .init(width: 300/3, height: 420/3)
        }
    }
}


struct Poster {
    let poster: UIImage?
}

extension Poster {
    static func dummy() -> [DisplayContent] {
        return [
            .movie([.init(poster: UIImage(named: "Movie1")),
                   .init(poster: UIImage(named: "Movie2")),
                   .init(poster: UIImage(named: "Movie3")),
                   .init(poster: UIImage(named: "Movie4")),
                   .init(poster: UIImage(named: "Movie5")),
                   .init(poster: UIImage(named: "Movie6"))]),
            .book([.init(poster: UIImage(named: "Book1")),
                   .init(poster: UIImage(named: "Book2")),
                   .init(poster: UIImage(named: "Book3")),
                   .init(poster: UIImage(named: "Book4")),
                   .init(poster: UIImage(named: "Book5")),
                   .init(poster: UIImage(named: "Book6"))]),
            .song([.init(poster: UIImage(named: "Song1")),
                   .init(poster: UIImage(named: "Song2")),
                   .init(poster: UIImage(named: "Song3")),
                   .init(poster: UIImage(named: "Song4")),
                   .init(poster: UIImage(named: "Song5")),
                   .init(poster: UIImage(named: "Song6"))])
        ]
    }
}
