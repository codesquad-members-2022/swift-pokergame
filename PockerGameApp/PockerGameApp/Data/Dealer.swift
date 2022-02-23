//
//  Dealer.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

struct Dealer{
    let role = "Dealer"
    private var cards: [Card] = []
    private var cardDeck: CardDeck = CardDeck()
    
    mutating func giveCard() -> Card?{
        guard let card = cardDeck.removeOne() else{
            return nil
        }
        return card
    }
    
    func checkingCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }
}
