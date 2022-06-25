import UIKit

//내가짠코드
func chooseRandomString(_ inputString: String) -> String{

    let randomIndex:Int = Int.random(in: 0..<inputString.count)
    var index: Int = 0
    var returnValue: String = ""

    for i in inputString {
//        guard index != randomIndex else {
//            returnValue = String(i)
//            break
//        }
//        index += 1
        if index == randomIndex {
            returnValue = String(i)
            break
        } else {
            index += 1
        }
    }
    
    return returnValue
}

print(chooseRandomString("안녕하세요"))

//func chooseRandomString(_ inputString: String) -> String{
//
//    let randomIndex:Int = Int.random(in: 0..<inputString.count)
//    var index: Int = 0
//    var returnValue: String = ""
//
//    for i in inputString {
//        guard index == randomIndex else {
//            index += 1
//            continue
//        }
//        returnValue = String(i)
//        break
//    }
//    return returnValue
//}
//
//print(chooseRandomString("안녕하세요"))

