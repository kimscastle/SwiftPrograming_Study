//
//  Article.swift
//  LionHeart_ArticleView
//
//  Created by uiskim on 2023/06/26.
//

import UIKit.UIImage

struct Article {}

extension Article {
    static func datas() -> [ArticleContentType] {
        return [
            .thumbNail(UIImage(named: "ArticleThumbNail1")!),
            .title(.init(title: "아기의 능력을 믿어라 아티클 제목 아티클 제목", uploadDate: "2023.05.23", publisher: "by. 똑게유아 저자 <로리>")),
            .quote("아기의 능력을 믿어라.\n아기는 스스로 할 수 있다.\n부모가 그렇게 할 수 있도록 도와줄 수 있다."),
            .content("이 문장을 마음에 새기도록 하자. 우는 아기를 달래고자 양육자가 시도하는 기상천외한 방법들은 가뜩이나 버거운 아이에게 더 많은 자극과 부담을 안겨줄 뿐이다."),
            .content("아기가 충분히 먹었고, 기저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해 참고해 정적인 방법으로 아기를 진정시켜주는 것이 좋다. 온종일 아기가 힘들었다는 것을 알아주고, 아기의 마음을 이해해줄 수 있는 여러분이 든든하게 존재한다는 느낌을 전해주면 된다."),
            .content("양육자는 아기가 적절한 시간대에, 적절한 간격으로, 적절한 양의 질 좋은 영양(모유/분유)과 수면을 취할 수 있도록 아기의 하루 일과를 계획해야 한다. 나는 이 과정을 부모들이 쉽게 이해할 수 있도록 ‘먹탱저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해크’와 ‘잠탱크’라는 개념을 만들어 설명하곤 한다. 두 개의 에너지 탱크를 머릿속에 이미지화해서 떠올리면 아기의 먹잠 스케줄을 일구는 방법이 한결 수월하게 이해될 것이다."),
            .block("블럭입니다블럭입니다블럭입니다저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다"),
            .quote("인용구쪽 좀 이쁘네.\n이거 잘쓰면 되게 이쁘게 나오겠다 View."),
            .content("양육자는 아기가 적절한 시간대에, 적절한 간격으로, 적절한 양의 질 좋은 영양(모유/분유)과 수면을 취할 수 있도록 아기의 하루 일과를 계획해야 한다. 나는 이 과정을 부모들이 쉽게 이해할 수 있도록 ‘먹탱크’와 ‘잠탱크’라는 개념을 만들어 설명하곤 한다. 두 개의 에너지 탱크를 머릿속에 이미지화해서 떠올리면 아기의 먹잠 스케줄을 일구는 방법이 한결 수월하게 이해될 것이다."),
            .block("블럭입니다블럭입니다블럭입니다저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해저귀도 젖지 않았다면, 오히려 이럴 때는 진정 계단을 참고해블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다블럭입니다"),
            .content("양육자는 아기가 적절한 시간대에, 적절한 간격으로, 적절한 양의 질 좋은 영양(모유/분유)과 수면을 취할 수 있도록 아기의 하루 일과를 계획해야 한다. 나는 이 과정을 부모들이 쉽게 이해할 수 있도록 ‘먹탱크’와 ‘잠탱크’라는 개념을 만들어 설명하곤 한다. 두 개의 에너지 탱크를 머릿속에 이미지화해서 떠올리면 아기의 먹잠 스케줄을 일구는 방법이 한결 수월하게 이해될 것이다.")
        ]
    }
}







