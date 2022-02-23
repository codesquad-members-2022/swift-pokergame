//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/23.
//

import Foundation

struct PokerGame {
    var type: PokerType
    let dealer: Dealer
    var players: [Player]
    
    var numberOfPlayers: Int {
        players.count
    }
    
    func start() {
        
    }
}

class Player {
    let name: String
    var cards: [Card]
    
    init(name: String, cards: [Card] = []) {
        self.name = name
        self.cards = cards
    }
}

class Dealer {
    var deck: CardDeck
    var cards: [Card]
    
    init(deck: CardDeck, cards: [Card] = []) {
        self.deck = deck
        self.cards = cards
        self.deck.shuffle()
    }
    
    func deal(numOfcards: Int) -> [Card] {
        var cards = [Card]()
        for _ in 0..<numOfcards {
            guard let drawn = deck.draw() else { return cards }
            cards.append(drawn)
        }
        return cards
    }
}

enum PokerType: Int {
    case fiveStud = 5
    case sevenStud = 7
}
