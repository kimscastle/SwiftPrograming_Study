import UIKit

func factorial(_ input: Int) -> Int {
    var result: Int = 1
    for i in 1...input {
        result *= i
    }
    return result
}

print(factorial(5))

//재귀함수
func factorialF(num: Int) -> Int {
    //재귀함수에서는 함수를 멈추게할 논리를 넣어줘야한다
    //그렇지않으면 stack over flow가 발생한다
    if num <= 1 {
        return 1
    }
    return num * factorialF(num: num - 1)
}

factorialF(num: 5)




