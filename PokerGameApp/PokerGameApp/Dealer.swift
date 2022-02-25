//
//  Dealer.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class Dealer: Player {
    private let cardDeck = CardDeck()
    private let stud: Stud
    
    init(name: String, stud: Stud) {
        self.stud = stud
        super.init(name: name)
    }
    
    func prepare() {
        cardDeck.shuffle()
    }
    
    func distributeCard(to team: Team) {
        team.loop { player in
            var removedCards = [Card]()
            for _ in 0..<stud.rawValue {
                guard let card = cardDeck.removeOne() else {
                    continue
                }
                removedCards.append(card)
            }
            player.handOver(cards: removedCards)
        }
    }
}
