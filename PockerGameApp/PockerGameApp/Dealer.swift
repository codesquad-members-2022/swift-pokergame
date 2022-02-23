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
        deck.shuffle()
        
        let allPlayers: [Playable] = players + [self]
        for player in allPlayers {
            var drawns = [Card]()
            for _ in 0..<numOfcards {
                guard let drawn = deck.draw() else { throw PokerGameError.tooManyPlayer }
                drawns.append(drawn)
            }
            player.receive(cards: drawns)
        }
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}
