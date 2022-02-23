//
//  Dealer.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/23.
//

import Foundation

class Dealer: Playable {
    var deck: CardDeck
    var cards: [Card]
    var players: [Player]
    
    init(deck: CardDeck, players: [Player], cards: [Card] = []) {
        self.players = players
        self.deck = deck
        self.cards = cards
    }
    
    func deal(numOfcards: Int) throws {
        // Dealer shuffles right before dealing
        deck.shuffle()
        
        let allPlayers: [Playable] = players + [self]
        for player in allPlayers {
            let drawns = try (0..<numOfcards).map { _ -> Card in
                if let drawn = deck.draw() {
                    return drawn
                } else {
                    throw PokerGameError.outOfCards
                }
            }
            player.receive(cards: drawns)
        }
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}
