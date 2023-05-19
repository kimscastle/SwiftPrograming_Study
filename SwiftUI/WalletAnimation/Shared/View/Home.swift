//
//  Home.swift
//  WalletAnimation (iOS)
//
//  Created by Balaji on 25/02/22.
//

import SwiftUI

// MARK: - test
struct Home: View {
    // MARK: - Animation Properties
    @State var expandCards: Bool = false
    var body: some View {
        VStack(spacing: 0) {
            Text("Wallet")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: expandCards ? .leading : .center)
                .padding(.horizontal, 30)
                .overlay(alignment: .trailing) {
                    
                    // MARK: - closeButton
                    Button {
                        withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                            expandCards = false
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue, in: Circle())
                    }
                    .rotationEffect(.init(degrees: expandCards ? 45 : 0))
                    .offset(x: expandCards ? -20 : 15)
                    .opacity(expandCards ? 1 : 0)
                }
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                //Contents
                VStack(spacing: 10) {
                    // MARK: - Cards
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
                .overlay {
                    Rectangle()
                        .fill(.black.opacity(expandCards ? 0 : 0.01))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                expandCards = true
                            }
                        }
                }
                .padding(.top, expandCards ? 30 : 0)

            }
            .coordinateSpace(name: "SCROLL")
            /// 단순히 offset만주면 scroll하면 카드바로위쪽에서 짤려서 좀 이상함
            /// 카드위에 영역이 생겨야하니까 expand되면 카드쪽 VStack에서 위에 영역이 생겨야함
            /// 카드영역인 overlay영역의 위쪽을 띄워줘야된다는 뜻(top padding을주자)
            /// y를 30을 줬다는건 지금 내렸다는거야 근데 위에 padding이 생기면 얘는 다시 그만큼 올라가야해
            /// 즉 padding이 생기는 expand상태가 되면 offset을 0으로바꾸면 그만큼 올라가는게되는거지
            .offset(y: expandCards ? 0 : 30)
            // MARK: - Add button
            Button {
                withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.7)) {
                    expandCards = false
                }
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(.blue, in: Circle())
            }
            .rotationEffect(.init(degrees: expandCards ? 180 : 0))
            
            /// 버튼이 작아지긴했어도 눌리는걸 방지하기위해 frame을 0으로
            .scaleEffect(expandCards ? 0.01 : 1)
            .opacity(!expandCards ? 1 : 0)
            .frame(height: expandCards ? 0 : nil)
            .padding(.bottom, expandCards ? 0 : 30)
            
        }
        /// 전체frame으로 잡혀있는 경우이기때문에 안쪽 padding
        .padding(.top)
    }
    
    @ViewBuilder
    func CardView(card: Card) -> some View {
        // MARK: - GeometryReader
        /// 가로와 세로길이를 이용한 view구성을하고싶을때
        GeometryReader { proxy in
            /// 나는 여기서 좌표를 이용해서 정보를 얻고싶기때문에 기준 frame을 이용해야함
            let rect = proxy.frame(in: .named("SCROLL"))
            
            /// 첫번째카드는 0 두번째카드는 1 세번째카드는 2니까 0, 70, 140만큼 떨어짐(맨위기준)
            let offset = -rect.origin.y + CGFloat(getIndex(card: card)*70)
            
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
            /// result : 3개가 겹쳐있는 상태
            .offset(y: expandCards ? 0 : offset)
        }
        // Max Size
        .frame(height: 200)
    }
    
    func getIndex(card: Card) -> Int {
        /// currentCard.id와 card.id가 같은 첫번째 요소의 index를 return
        return cards.firstIndex { currentCard in
            return currentCard.id == card.id
        } ?? 0
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
