//
//  Model.swift
//  CompositionalLayout
//
//  Created by uiskim on 2023/05/01.
//

import UIKit

extension UIImage {
    static var one: UIImage {
        UIImage(named: "one")!
    }
    
    static var two: UIImage {
        UIImage(named: "two")!
    }
    
    static var three: UIImage {
        UIImage(named: "three")!
    }
    
    static var four: UIImage {
        UIImage(named: "four")!
    }
}

struct MockData {
    static let shared = MockData()
    
    private let mustWatchList: ListSection = .mustWatchList([
        .init(name: "더 디저트", image: .one),
        .init(name: "더 타임호텔", image: .two),
        .init(name: "부산촌놈 in 시드니", image: .three),
        .init(name: "청춘 MT", image: .four)
    ])
     
    private let quickVODList: ListSection = .quickVODList([
        .init(name: "더 디저트", image: .one),
        .init(name: "더 타임호텔", image: .two),
        .init(name: "부산촌놈 in 시드니", image: .three),
        .init(name: "청춘 MT", image: .four)
    ])
    
    private let watchingList: ListSection = .watchingList([
        .init(name: "더 디저트", image: .one),
        .init(name: "더 타임호텔", image: .two),
        .init(name: "부산촌놈 in 시드니", image: .three),
        .init(name: "청춘 MT", image: .four)
    ])
    
    private let rankingList: ListSection = .rankingList([
        .init(name: "더 디저트", image: .one),
        .init(name: "더 타임호텔", image: .two),
        .init(name: "부산촌놈 in 시드니", image: .three),
        .init(name: "청춘 MT", image: .four)
    ])
     
    
    private let famousLiveChannel: ListSection = .famousLiveChannel([
        .init(name: "더 디저트", image: .one),
        .init(name: "더 타임호텔", image: .two),
        .init(name: "부산촌놈 in 시드니", image: .three),
        .init(name: "청춘 MT", image: .four)
    ])
    
    var pageData: [ListSection] {
        return [mustWatchList, quickVODList, watchingList, rankingList, famousLiveChannel]
    }
}

struct VideoInfo {
    let name: String
    let image: UIImage
}


