import UIKit
import Combine

var myIntArrayPublisher: Publishers.Sequence<[Int], Never> = [1, 2, 3].publisher

// MARK: - 데이터를 받아야함 .sink
myIntArrayPublisher.sink { completion in
    
    // MARK: - 데이터를 다받고나면 어떻게 할지를 설정해야함, Never
    switch completion {
    case .finished:
        print("완료")
    case .failure(let error):
        print(error)
    }
    
  // MARK: - 실제로 데이터가 들어오면 어떻게 할지를 설정, [Int]
} receiveValue: { recievedValue in
    print("값을 받았다: \(recievedValue)")
}

var myNotification = Notification.Name("applicationName")
var myDefaultPublisher = NotificationCenter.default.publisher(for: myNotification)

var mySubscription = Set<AnyCancellable>()

myDefaultPublisher.sink { aa in
    switch aa {
    case .finished:
        print("끝")
    case .failure(let error):
        print(error)
    }
} receiveValue: { value in
    print(value)
}.store(in: &mySubscription)


NotificationCenter.default.post(Notification(name: myNotification))

//KVO - Key value observing
class MyFriend {
    var name = "철수" {
        didSet {
            print("name - didSet() : ", name)
        }
    }
}

var myFriend = MyFriend()

["영수"].publisher.assign(to: \.name, on: myFriend).store(in: &mySubscription)
