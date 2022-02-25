//
//  Dealer.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

class Dealer: Playable {
    
    private(set) var cardDeck: CardDeck
    private(set) var name: String
    private(set) var hand: Hand
    
    init() {
        self.cardDeck = CardDeck()
        self.name = "Dealer"
        self.hand = Hand()
    }
    
    func canDrawCards(count: Int) -> Bool {
        return self.cardDeck.count >= count
    }
    
    func distributeHand(to participants: Participants, by stud: Int) {
        participants.players.forEach { player in
            (0..<stud).forEach { _ in
                player.receive(card: self.cardDeck.draw())
            }
        }
    }
    
    func generateShuffledCardDeck() {
        self.cardDeck.setUpCards()
        self.cardDeck.shuffle()
    }
    
    func setUpPokerGame(stud: Int, participants: Participants) {
        self.generateShuffledCardDeck()
        self.distributeHand(to: participants, by: stud)
    }
}
