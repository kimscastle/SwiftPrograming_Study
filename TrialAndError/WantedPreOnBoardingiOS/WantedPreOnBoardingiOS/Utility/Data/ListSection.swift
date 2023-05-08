//
//  ListSection.swift
//  CompositionalLayout
//
//  Created by uiskim on 2023/05/01.
//

import Foundation

enum ListSection {
    case mustWatchList([VideoInfo])
    case quickVODList([VideoInfo])
    case watchingList([VideoInfo])
    case rankingList([VideoInfo])
    case famousLiveChannel([VideoInfo])
    
    var items: [VideoInfo] {
        switch self {
        case .mustWatchList(let items),
                .quickVODList(let items),
                .watchingList(let items),
                .rankingList(let items),
                .famousLiveChannel(let items):
            return items

        }
    }
    
    var counts: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .mustWatchList(_):
            return "티빙에서 꼭 봐야하는 콘텐츠"
        case .quickVODList(_):
            return "Quick VOD"
        case .watchingList(_):
            return "김의성님이 시청하는 콘텐츠"
        case .rankingList(_):
            return "티빙 TOP20 프로그램"
        case .famousLiveChannel(_):
            return "인기 LIVE채널"
        }
    }
}
