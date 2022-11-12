//
//  MyViewModel.swift
//  combine_textfield_tutorial
//
//  Created by Jeff Jeong on 2020/10/13.
//

import Foundation
import Combine

class MyViewModel {
    
    // MARK: - 구독이 가능한 변수를 설정
    // 데이터를 받을 수 있는 변수라는 뜻
    @Published var passwordInput: String = ""
    @Published var passwordComfirmInput: String = ""
    
    // MARK: - 나중에 설정되는 값
    lazy var isMatchPasswordInput: AnyPublisher<Bool, Never> = Publishers
        //Publised를 Publisher로 받는법
        .CombineLatest($passwordInput, $passwordComfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if password == "" || passwordConfirm == "" {
                return false
            }
            
            if password == passwordConfirm {
                return true
            } else {
                return false
            }
            
        })
        .print()
        .eraseToAnyPublisher()
}
