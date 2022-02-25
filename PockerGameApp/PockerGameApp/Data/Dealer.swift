//
//  Dealer.swift
//  PockerGameApp
//
//  Created by juntaek.oh on 2022/02/23.
//

import Foundation

class Dealer{
    let role: String
    private var cards: [Card] = []
    private var cardDeck: CardDeck = CardDeck()
    
    func giveCard() -> Card?{
        guard let card = cardDeck.removeOne() else{
            return nil
        }
        return card
    }
    
    func shuffleCardDeck() -> Int{
        if cardDeck.count() < 52{
            self.cardDeck.reset()
            self.cardDeck.shuffle()
        } else{
            self.cardDeck.shuffle()
        }
        
        return self.cardDeck.count()
    }
    
    func showMyCards() -> [Card]{
        return self.cards
    }
    
    func receiveCard(card: Card){
        cards.append(card)
    }
    
    func removeCards(){
        self.cards.removeAll()
    }
    
    init(role: String){
        self.role = role
    }
}
