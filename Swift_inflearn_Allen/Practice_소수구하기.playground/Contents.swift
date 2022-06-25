import UIKit

//내가짠 코드
//약수 = input숫자 % 2..<input숫자 == 0 이 되면 약수
func findPrimeNumber(_ num: Int) {
    if num < 0 || num == 1 {
        print("소수가 아닙니다1")
    }
    for i in 2..<num {
        if num % i == 0 {
            print("소수가아닙니다2")
            return
        }
    }
    print("소수입니다")
//    for i in 2..<num {
//        guard num % i != 0 else {
//            print("소수가 아닙니다")
//            return
//        }
//    }
//    print("소수입니다")
}

findPrimeNumber(97)
