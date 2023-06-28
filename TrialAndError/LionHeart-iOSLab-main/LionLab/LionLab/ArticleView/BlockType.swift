//
//  BlockType.swift
//  LionLab
//
//  Created by 김민재 on 2023/06/27.
//

import Foundation

// 2안
enum BlockType {
    case thumbnail(Header)
    case quotation(String)
    case body(String)
    case callOut(String)
}


struct Header {
    let title: String
    let uploadDate: String
    let writer: String
}

