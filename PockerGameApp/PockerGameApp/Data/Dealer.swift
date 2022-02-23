//
//  Dealer.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

class Dealer{
    let role = "Dealer"
    private var cards: [Card] = []
    private var cardDeck: CardDeck = CardDeck()
    
    func giveCard() -> Card?{
        guard let card = cardDeck.removeOne() else{
            return nil
        }
        return card
    }
    
    func receiveCard(card: Card){
        cards.append(card)
    }
    
    func checkingCards() -> [String]{
        var cardsDescription: [String] = []
        
        cards.forEach{ card in
            cardsDescription.append(card.description)
        }
        
        return cardsDescription
    }
    
    func shuffleCardDeck() -> Int{
        self.cardDeck.shuffle()
        
        return self.cardDeck.count()
    }
}
