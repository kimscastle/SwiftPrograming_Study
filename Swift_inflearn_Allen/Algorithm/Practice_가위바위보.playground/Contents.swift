import UIKit

let computerCases = ["가위", "바위", "보"]
var randomNumber = Int.random(in: 0...2)
var computer = computerCases[randomNumber]

let myChoice: String = "가위"

print("컴퓨터는 \(computer)를 냈습니다")

//if myChoice != computer {
//    if myChoice == "가위" {
//        if randomNumber == 1 {
//            print("졌습니다")
//        } else {
//            print("이겼습니다")
//        }
//    } else if myChoice == "바위"{
//        if randomNumber == 2 {
//            print("졌습니다")
//        } else {
//            print("이겼습니다")
//        }
//    } else if myChoice == "보" {
//        if randomNumber == 0 {
//            print("졌습니다")
//        } else {
//            print("이겼습니다")
//        }
//    }
//} else {
//    print("비겼습니다")
//}

//리펙토링 후

if myChoice != computer {
    if myChoice == "가위" && randomNumber == 1 {
        print("졌습니다")
    } else if myChoice == "바위" && randomNumber == 2 {
        print("졌습니다")
    } else if myChoice == "보" && randomNumber == 0 {
        print("졌습니다")
    } else {
        print("이겼습니다")
    }
} else {
    print("비겼습니다")
}

