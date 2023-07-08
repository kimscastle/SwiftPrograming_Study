//
//  Model.swift
//  CellReuseProblem
//
//  Created by uiskim on 2023/02/11.
//

import Foundation

/// 명시용
protocol DTO {}
protocol AppData {}

typealias Request = Encodable
typealias Response = Decodable

struct Model: Request, AppData {
    let name: String
    let age: Int
}

struct ModelDTO: Codable, DTO {
    let name: String
    let age: Int
}
