//
//  Participant.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/03/28.
//

import Foundation

class Participant : Playable {
    
    let name: String
    
    private var playerDeck: [Card] = []
    private var hand : Hand = .highCard
    var cardCount: Int {
        return playerDeck.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func openAllCards() -> [Card] {
        return playerDeck
    }
    
    func addCard(card: Card) {
        playerDeck.append(card)
    }
    
    func intruduceYourSelf() -> String {
        return "\(self.name)"
    }
}
