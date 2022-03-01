//
//  Player.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/25.
//

import Foundation

class Player {
    
    private let name: String
    private var cards: Array<Card>
    
    init(name: String) {
        self.name = name
        self.cards = Array<Card>()
    }
    
    func addCard(_ card: Card) {
        self.cards.append(card)
    }
    
    func getCardsCount() -> Int {
        return cards.count
    }
    
    func printName() {
        print(self.name)
    }
    
    func printCards() {
        print("Player \(self.name)'s cards : ")
        print(cards)
    }
}
