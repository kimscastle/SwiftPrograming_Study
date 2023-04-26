//
//  Array+.swift
//  ExInfiniteCarousel
//
//  Created by uiskim on 2023/04/26.
//
import UIKit

extension Array {
    mutating func makeInfinityCarouselArray() {
        self.insert(self[self.count-1], at: 0)
        self.append(self[1])
    }
}
