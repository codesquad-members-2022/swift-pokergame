//
//  Dealer.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

struct Dealer: Playable {
    
    private(set) var cardDeck: CardDeck
    private(set) var name: String
    var hand: Hand
    
    init() {
        self.cardDeck = CardDeck()
        self.name = "Dealer"
        self.hand = Hand()
    }
    
    func canDrawCards(count: Int) -> Bool {
        return self.cardDeck.count >= count
    }
    
    mutating func distributeHand(to participants: Participants, by stud: Int) {
        participants.players.forEach { player in
            (0..<stud).forEach { _ in
                player.receive(card: self.cardDeck.draw())
            }
        }
    }
    
    mutating func generateShuffledCardDeck() {
        self.cardDeck.setUpCards()
        self.cardDeck.shuffle()
    }
    
    mutating func setUpPokerGame(stud: Int, participants: Participants) {
        self.generateShuffledCardDeck()
        self.distributeHand(to: participants, by: stud)
    }
}
