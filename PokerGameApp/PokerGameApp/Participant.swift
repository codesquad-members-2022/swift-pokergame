//
//  Participant.swift
//  PokerGameApp
//
//  Created by Selina on 2022/02/28.
//

import Foundation

class Participant: CustomStringConvertible {
    var description: String {
        return "😎\(self.cards)"
    }
    
    private var cards = [Card]()
    
    func receive(card: Card) {
        
    }
}
