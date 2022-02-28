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
    
    private let name: String
    private var cardDeck: [Card] = []
    private var upCards: [Card] = []
    
    init(name: String) {
        self.name = name
    }
}
