//
//  Home.swift
//  WalletAnimation (iOS)
//
//  Created by Balaji on 25/02/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
            
            ScrollView(.vertical, showsIndicators: false) {
                //Contents
                VStack(spacing: 0) {
                    // MARK: - Cards
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
            }
            .coordinateSpace(name: "SCROLL")
        }
        /// 전체frame으로 잡혀있는 경우이기때문에 안쪽 padding
        .padding(.top)
    }
    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        // MARK: - GeometryReader
        GeometryReader { proxy in
            /// 나는 여기서 좌표를 이용해서 정보를 얻고싶기때문에
            /// 기준 frame을 이용해야함
            let rect = proxy.frame(in: .named("SCROLL"))
            
            ZStack(alignment: .bottomLeading) {
                Image(card.cardImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(card.name)
                        .fontWeight(.bold)
                    
                    Text(hideCardNumber(number: card.cardNumber))
                        .font(.callout)
                        .fontWeight(.bold)
                }
                /// text의 frame이 잡혀있는(text는 자동크기)경우이기때문에 바깥쪽 padding
                .padding()
                .padding(.bottom, 10)
                .foregroundColor(.white)
            }
            .centerPosition(geo: proxy)
            /// 기준frame에서 Y좌표 떨어져있는만큼 올려줘
            .offset(y: -rect.origin.y)
        }
        // Max Size
        .frame(height: 200)
    }
    
    // MARK: - 마지막 4개숫자를 제외하고 나머지 숫자 숨기기
    func hideCardNumber(number: String) -> String {
        var newValue: String = ""
        let maxCount = number.count - 4
        /// enumerated를 하면 (offset: index값, element: 요소의값)으로 변환된다 점접근연산자로 접근가능
        number.enumerated().forEach { value in
            /// 맨뒤에 4개는 그 요소(element값을 그대로 newValue에 추가해줘)
            if value.offset >= maxCount {
                newValue.append(value.element)
            } else {
                /// 맨뒤 4개 요소들을 제외하고는 만약에 element가 빈문자열이면 그대로 아니면 *로바꿔서 추가
                newValue.append(value.element == " " ? value.element : "*")
            }
        }
        return newValue
    }
}

extension View {
    func centerPosition(geo: GeometryProxy) -> some View {
        self.position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
    }
}

struct Home_PreView: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
