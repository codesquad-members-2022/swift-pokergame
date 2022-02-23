//
//  Dealer.swift
//  PokerGameApp
//
//  Created by dale on 2022/02/23.
//

import Foundation

struct Dealer {
    var name = "Dealer"
    private var hand : [Card] = []
    
    mutating func getCard(card: Card) {
        self.hand.append(card)
    }
    
    func draw() {
        
    }
}
