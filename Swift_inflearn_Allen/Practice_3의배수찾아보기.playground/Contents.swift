import UIKit

//for i in 1...100 {
//    if i % 3 == 0 {
//        print("3의 배수 발견: \(i)")
//    }
//}

//조금 더 가독성이 높아지는 구현

for i in 1...100 {
    if i % 3 != 0 {
        continue
    }
    //걸러내는 논리를 구현할때는 continue를 많이 사용함
    print("3의 배수 발견: \(i)")
}

//3의 배수를 걸러낸다 = 조건을 만족하지 않는 모든 경우를 continue가 포함된 조건문으로 걸러준다
