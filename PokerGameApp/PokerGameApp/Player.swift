//
//  Player.swift
//  PokerGameApp
//
//  Created by YEONGJIN JANG on 2022/02/28.
//

import Foundation

class Player: Playable {
    func addCard(card: Card) {
        <#code#>
    }
    
    func showUpCards() -> String {
        <#code#>
    }
    
    func openAllCards() -> String {
        <#code#>
    }
    
    var name: String
    var cardDeck: [Card] = []
    var upCards: [Card] = []
    var hand: Computer.Hands = .highCard
    
    init(name: String) {
        self.name = name
    }
}
