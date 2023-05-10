import UIKit

/// 의존관계 역전 원칙(DPI: Dependency inversion priciple)
/// 의존관계 역전 원칙은 `상위모듈`이 `하위모듈`에게 의존하지 않도록 설계하는것을 의미한다
/// `추상화`를 통해 간접적으로 의존하게 만들어야한다
/// swift에서 `추상화`의 의미는 세부적인 구현사항이 아닌 어떤 동작을 할것인지만을 알려주는 느낌 -> 대표적인 방식이 프로토콜

/// `의존성` : Dependency - 한 객체가 다른 객체에 의존하는 것을 의미한다

/// 예시1
// 하위 모듈
//class Engine {
//    func start() {
//        print("엔진가동")
//    }
//}
//
//// 상위 모듈
//class Car {
//
//    // 강하게 결합되어있는 상태
//    let engine = Engine()
//
//    func start() {
//        // 하위 모듈을 의존
//        engine.start()
//        print("차가 출발합니다")
//    }
//}
//
//let myCar = Car()
//myCar.start()
// 엔진가동
// 차가 출발합니다

/// 여기서 `상위모듈`은 `Car`클래스이고 `하위모듈`은 `engine`클래스인데
/// `car`객체가 `engine`객체에 의존하는 상황이기때문에 의존관계가 생겨 `의존관계역전원칙`도 위반하게된다
/// `의존관계역전원칙(DPI)`를 위반했다는 것은 `상위모듈`과 `하위모듈`에 `의존관계`가 생겼다는 의미가 되고 아래와 같은 문제가 발생한다

class ElectricMotor {
    func start() {
        print("전기모터 가동")
    }
}

class Car {
    // 기존에 Engine객체 자체를 수정해야하기때문에 class 내부를 수정해야하는 일이 생기게된다
    // 의존하는 객체 수정
    let motor = ElectricMotor()

    // 내부 동작 수정
    func start() {
        motor.start()
        print("차가 출발합니다.")
    }
}

let myCar = Car()
myCar.start()

// 전기모터 가동
// 전기차가 출발합니다.

/// 매번 객체가 바뀔때마다 클래스내부에 들어가서 강하게 결합되어있는 하위객체를 바꿔야하는 문제가 발생한다
/// 이를 해결하기 위해서 `의존성주입(DI)`이라는 방법을 사용하게된다
/// 여러가지방법이 있는데 그중에서는 `인터페이스주입`이라는 방식에 대해 알아보려한다
/// 인터페이스란? : 객체와 객체사이에 상호작용을 정의하는 `추상적인개념`
/// swift에서는 추상화 방법으로 `protocol`을 사용한다


//// 프로토콜 정의
//protocol EngineProtocol {
//    func start()
//}
//
//// 하위 모듈 - 프로토콜 채택
//class Engine: EngineProtocol {
//    func start() {
//        print("엔진 가동")
//    }
//}
//
//// 하위 모듈 - 가솔린 엔진
//class GasolineEngine: EngineProtocol {
//    func start() {
//        print("가솔린 엔진 가동")
//    }
//}
//
//// 하위 모듈 - 전기 모터 (추가)
//class ElectricMotor: EngineProtocol {
//    func start() {
//        print("전기모터 가동")
//    }
//}
//
//
//// 상위 모듈 - 생성 시 프로토콜을 파라미터로 받음
//class Car {
//    private let engine: EngineProtocol
//
//    init(engine: EngineProtocol) {
//        self.engine = engine
//    }
//
//    func start() {
//        // 프로토콜을 이용해 하위 모듈의 메서드 사용
//        engine.start()
//        print("차가 출발합니다.")
//    }
//}
//
//let engine = Engine()
//let myCar = Car(engine: engine)
//myCar.start()
//
//let gasoline = GasolineEngine()
//let motor = ElectricMotor()
//
//let myGasolineCar = Car(engine: gasoline)
//let myElectricCar = Car(engine: motor)
//
//myGasolineCar.start()
//// 가솔린 엔진 가동
//// 차가 출발합니다.
//
//myElectricCar.start()
//// 전기모터 가동
//// 차가 출발합니다.

/// 결론적으로 추상화를 이용해서 `의존성주입`방식을 사용하면 상위객체의 코드를 수정하지 않고 확장에 용이하게된다
///
///
protocol Base: AnyObject {
    var name: String { get }
}

class ViewModel: Base {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class SecondViewModel {
    var nickName: String
    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController {
    
    let viewModel: Base
    
    init(viewModel: Base) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

let VM = ViewModel(name: "Youth")
let VC = ViewController(viewModel: VM)
