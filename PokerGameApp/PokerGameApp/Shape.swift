//
//  Shape.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/03/01.
//

import Foundation

enum Shape: String, CaseIterable {
    case spades = "♠︎"
    case hearts = "♥︎"
    case clubs = "♣︎"
    case diamonds = "♦︎"
}

extension Shape: CustomStringConvertible {
    var description: String {
        return "\(self.rawValue)"
    }
}
