//
//  Models.swift
//  MoreButton_CommentBox
//
//  Created by uiskim on 2022/10/22.
//

import Foundation

struct Review {
    let name: String
    let point: String
    let date: String
    let content: String
}

let reviews: [Review] = [
        Review(name: "김유스",
               point: "4.0",
               date: "2022.10.01",
               content: "너리ㅓㅑㅐ더ㅐ퍄ㅓ패ㅑㅓㅁ내ㅜㅇ림누이;푸ㅑ푸ㅐ두ㅐㅜ매ㅑㅜ애ㅜㅍㅁ너ㅜ이휘주해ㅜㅠㅐㅑㅜ매루매뉨뉘ㅜ림누ㅐㅜㅠㅐㅜㄴ리ㅓㅏㅠㅜㅁ니;ㅏ우ㅐㄹ모ㅜ대무ㅐ미ㅏ뉘ㅠㅜㄴ미ㅠㅜ매냐ㅜ"),
        Review(name: "김찰리",
               point: "3.0",
               date: "2022.10.02",
               content: "ㅁ내ㅓ램너ㅐ럼내ㅓ퓨ㅐ너ㅠㅐㅁ누류ㅐㅁ냐ㅜㅐ러무재대먀쥬ㅜㅐㅁ냐ㅜㅐㅠㅜㅁ내ㅜㅐ저대랴ㅗㅜ쟈ㅠ노ㅓ퓸나ㅣ루ㅏ너우 ㅏ우퍄ㅏ모ㅠㅜㅑㅗㅠㅍ먀노루ㅐㅁㅈ도ㅜ랴ㅕ흄뇨ㅕㅑㄹ흄녀ㅗㅠ핌노ㅑㅣㅗㅕㄹ;ㅐ먀뎌ㅗ랴ㅣㅕㅁ뉴ㅑㅣ퓸 냐ㅣ유ㅕ랴ㅣㅁㄴ댜롲ㅁ뎌ㅑ로ㅜ먀녀ㅠ퍔뉴랴ㅣㅕㅁ조댜ㅣㄱ렴쥬ㅕㅑㅣㅎ ㅁ냐ㅣ윪녀ㅑㅐ랴ㅣㅁ조댜ㅣㅗㅠ무냐ㅕ퓨며ㅗㅇ휴래조ㅕㅜㅐ;도ㅜ래;ㅁ져ㅓㅜㅎ먀ㅣ녀우ㅠ퍄ㅣㅁ져ㅠ댜려ㅠㅁ쟈ㅣ듛ㅁ쟈ㅣ어ㅑㅏ륨냐ㅐㅣㅕㅎ"),
        Review(name: "김애셔",
               point: "5.0",
               date: "2022.10.03",
               content: "ㅇ류ㅓㅐㅑㅓ래허ㅜㄴ갸ㅐㅗㅜ햠더규ㅜㄹ묘ㅗㅕㅑㅈ휴려ㅛ듀ㅏ머뉴햐ㅣㅁ뉴ㅜ랴ㅐㅕㅣㅗㅁ누ㅑㅐ;로ㅜㅁ쟈퓨ㅜㅑㅁ져ㅣㅠㅕㅎㅁ쥳려ㅛㅁ쥬려ㅑㅠㅁㅈ려흄디휴팸듀ㅕㄱ햐ㅐㅣ뮺댜ㅕ휴ㅑㅣ마쥬햐ㅣㅁ쥬ㅑ류ㅜㅁ쟈ㅣ로ㅕㅑㅐㅁㅈ도ㅓㅜㅑㅐ0;ㅎ조ㅜㅑㅎ퓨ㅗㅜ먀고ㅜㅎㅍㅁ재;ㅠㅜㅎ패;ㅁ도ㅠ궇래ㅔ며졷ㅅ9레ㅕ조무뎌ㅑ류ㅑㅣㅏㅁㅈ듁ㄹ해제;ㅁ도혀9ㅑㅔㅁㅈ게;ㅎ볒도멯9ㅁ좨0ㅗ후9ㅐㅕㅗ잰홰;ㅈ며ㅙㅗ갲돼;ㅗ해조햄ㅈ;ㅙ랴ㅗㅜ재;댜ㅗ해;ㅁ좯햐ㅗㅁㅈ;ㅐ도ㅑ해wheofu조댜ㅕ롣주ㅑㅠ랴ㅣ녁홎ㅁ0도혀ㅐㅑ조대혀ㅗㅈ3ㅐ0돗ㅎㅈ9ㅐㅗ해져ㅗㅎ팸져ㅓㅜㅐ럼주ㅐ;러ㅑㅐ쟈허ㅔㅈ먀거ㅙㅔ;ㅁ조ㅓㅜㅐ로ㅜ재;몰;ㅐㅁ노야해;조ㅑㅇ해;ㅑㅁ조ㅜㅐ;도ㅓㄱ래;ㅁ쟈ㅗㅜㅎ;ㅐㅁ더해ㅑ;ㅁ저댛;머재;ㅑㅗ해;ㅕ조ㅜ햐ㅕㅗㅜㅈ먀ㅣ휴ㅕㅈ매;ㅔㄷ호재ㅑ도해;ㅈ모ㅓ햐ㅐ뫃"),
        Review(name: "김규",
               point: "1.0",
               date: "2022.10.04",
               content: "매ㅓ램너램너래ㅓㄴ매ㅠㅜ매ㅜㅠㅐ무ㅐ무ㅐ;모ㅜ")
    ]

