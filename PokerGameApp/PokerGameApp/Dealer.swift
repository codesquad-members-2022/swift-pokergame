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
    
    func isOutOfCard() -> Bool {
        return cardDeck.count() == 0
    }
    
    func prepare() {
        cardDeck.shuffle()
    }
    
    func start(with team: Team, outOfCard: (Bool) -> Void) {
        while (cardDeck.count() != 0) {
            team.loop { player in
                guard let card = cardDeck.removeOne() else {
                    return
                }
                player.handOver(cards: [card])
            }
        }
        outOfCard(true)
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
