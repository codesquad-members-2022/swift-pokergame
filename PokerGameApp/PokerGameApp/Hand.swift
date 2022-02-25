//
//  Hand.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

protocol Handable {
    var cards: [Card] { get }
    mutating func receive(card: Card)
}

struct Hand: Handable {
    var cards: [Card]
    
    init() {
        self.cards = [Card]()
    }
}

extension Hand {
    mutating func receive(card: Card) {
        self.cards.append(card)
    }
}
