//
//  Player.swift
//  PokerGameApp
//
//  Created by 최예주 on 2022/02/28.
//

import Foundation

class Player{
    
    private var name: String
    private(set) var cards: [Card] = []
    var cardCount: Int {
        return cards.count
    }
    
    init(name: String) {
        self.name = name
    }
    
    func receive(_ card: Card){
        cards.append(card)
    }
    
    
    
    
    
}
