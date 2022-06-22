import UIKit

var computerChoice = Int.random(in: 1...10)
var myChoice: Int = 3

//switch myChoice {
//case let n where n < computerChoice :
//    print("Up")
//case let n where n > computerChoice :
//    print("Down")
//default :
//    print("Bingo")
//}

if computerChoice > myChoice {
    print("Up")
} else if computerChoice < myChoice {
    print("Down")
} else {
    print("Bingo")
}
