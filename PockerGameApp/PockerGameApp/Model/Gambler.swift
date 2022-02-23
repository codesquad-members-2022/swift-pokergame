//
//  Gambler.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Gambler {
    
    let name: String
    var cardDeck = CardDeck.init(with: [])
    
    init(name: String) {
        self.name = name
    }
    
    public func getCard(_ card: Card) {
        self.cardDeck.add(card)
    }
}

extension Gambler: CustomStringConvertible {
    
    var description: String {
        return "\(self.name) \(self.cardDeck)"
    }
}
