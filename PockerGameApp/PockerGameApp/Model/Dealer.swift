//
//  Dealer.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class Dealer {
    
    private var wholeDeck = CardDeck()
    private var cardDeck = [Card]()
    
    public func distributeCard(to gamblers: [Gambler], in rule: GameRule) {
        guard wholeDeck.count >= rule.numberOfCard * (gamblers.count + 1) else { return }
        shuffleWholeDeck()
        for _ in 0..<rule.numberOfCard {
            for index in 0..<gamblers.count {
                guard let newCard = pickCard() else { return }
                gamblers[index].receiveCard(newCard)
            }
            guard let newCard = pickCard() else { return }
            cardDeck.append(newCard)
        }
    }
    
    private func pickCard() -> Card? {
        return wholeDeck.removeOne()
    }
    
    private func shuffleWholeDeck() {
        self.wholeDeck.shuffle()
    }
}
