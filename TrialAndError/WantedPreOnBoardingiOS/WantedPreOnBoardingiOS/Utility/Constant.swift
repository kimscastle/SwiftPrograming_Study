//
//  Constant.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import Foundation

struct CustomImage {
    static let defaultImage = "photo"
    static let imageSize: CGFloat = 80
    private init() {}
}

struct CellSize {
    static let cellHight: CGFloat = 100
    private init() {}
}

struct ProgressSize {
    static let progressHeight: Double = 8
    static var progressRoundCorner: Double {
        return self.progressHeight / 2
    }
    
    private init() {}
}
