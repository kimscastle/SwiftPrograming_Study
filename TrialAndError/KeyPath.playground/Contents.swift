import UIKit

struct Company {
    enum CompanyType {
        case startUp
        case huge
    }
    let name: String
    let type: CompanyType
    let isPublic: Bool
    let stockPrice: Int
}

let companies: [Company] = [
    .init(name: "aa", type: .huge, isPublic: false, stockPrice: 145),
    .init(name: "bb", type: .huge, isPublic: false, stockPrice: 200),
    .init(name: "cc", type: .startUp, isPublic: true, stockPrice: 50),
    .init(name: "dd", type: .startUp, isPublic: true, stockPrice: 39),
    .init(name: "ee", type: .huge, isPublic: true, stockPrice: 200)
]

func demo() {
    companies.filter(\.type == .huge).filter(!\.isPublic).filter(\.stockPrice > 150).map(\.name)
}

func > <T, V: Comparable>( _ leftHandSide: KeyPath<T, V>, _ rightHandSide: V) -> ((T) -> Bool) {
    return { $0[keyPath: leftHandSide] > rightHandSide }
}

func == <T, V: Equatable>(lhs: KeyPath<T, V>, rhs: V) -> ((T) -> Bool) {
    return { $0[keyPath: lhs] == rhs }
}


prefix func !<T>(keyPath: KeyPath<T, Bool>) -> ((T) -> Bool) {
    return { !$0[keyPath: keyPath] }
}
