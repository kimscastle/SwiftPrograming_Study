//
//  Constant.swift
//  WantedPreOnBoardingiOS
//
//  Created by uiskim on 2023/02/20.
//

import UIKit

enum CustomImage {
    static let defaultImage = "photo"
    static let imageSize: CGFloat = 80
}

enum CellSize {
    static let cellHight: CGFloat = 100
}

enum ProgressSize {
    static let progressHeight: Double = 8
    static var progressRoundCorner: Double {
        return self.progressHeight / 2
    }
}
