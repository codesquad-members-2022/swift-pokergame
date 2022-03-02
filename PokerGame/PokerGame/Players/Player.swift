//
//  Player.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/24.
//

import Foundation

class Player {
   
    private var name: String
    private var cards: [Card] = []
    
    func getCard(card: Card) {
        cards.append(card)
    }
    
    init(name: String) {
        self.name = name
    }
}
