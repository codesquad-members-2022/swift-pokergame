//
//  PokerGame.swift
//  PokerGameApp
//
//  Created by Bumgeun Song on 2022/02/23.
//

import Foundation

struct PokerGame {
    var type: PokerType
    var players: [Player]
    var numberOfPlayers: Int {
        players.count
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
    }
}

enum PokerType {
    case fiveStud
    case sevenStud
}
