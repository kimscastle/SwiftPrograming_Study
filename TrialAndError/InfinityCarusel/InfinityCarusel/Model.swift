//
//  Model.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//

import UIKit

struct TvingPoster {
    let posterImage: UIImage?
    let title: String
    let content: String
}

extension TvingPoster {
    static func dummy() -> [TvingPoster] {
        return [
            .init(posterImage: .init(named: "poster1"), title: "최강야구", content: "사상 최강 야구팀이 생겼다!\n야구 강팀이 펼치는 양보없는 대결"),
            .init(posterImage: .init(named: "poster2"), title: "패밀리", content: "본격 가족사수 첩보 코미디 시작!\n평범한가족의 아슬아슬한 이중생활"),
            .init(posterImage: .init(named: "poster3"), title: "래빗홀", content: "개인주의는 기본, 사사로운감정은 환영\n100프로사심기반 여행프로젝트"),
            .init(posterImage: .init(named: "poster4"), title: "아워게임", content: "LG Twins의 그 험난했던 2022시즌!\n오직티빙에서만 볼수있는 이야기")
        ]
    }
}

