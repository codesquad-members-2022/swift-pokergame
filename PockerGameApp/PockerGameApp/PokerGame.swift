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
    
    func start() throws {
        try dealer.deal(numOfcards: type.numberOfCards)
    }
}

enum PokerType {
    case fiveStud
    case sevenStud
    
    var numberOfCards: Int {
        switch self {
        case .fiveStud: return 5
        case .sevenStud: return 7
        }
    }
}

protocol Playable {
    var cards: [Card] { get }
    
    func receive(cards: [Card])
}

class Player: Playable {
    let name: String
    var cards: [Card]
    
    init(name: String, cards: [Card] = []) {
        self.name = name
        self.cards = cards
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}

class Dealer: Playable {
    var deck: CardDeck
    var cards: [Card]
    var players: [Player]
    
    init(deck: CardDeck, players: [Player], cards: [Card] = []) {
        self.players = players
        self.deck = deck
        self.cards = cards
        self.deck.shuffle()
    }
    
    func deal(numOfcards: Int) throws {
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

enum PokerGameError: Error {
    case tooManyPlayer
}
