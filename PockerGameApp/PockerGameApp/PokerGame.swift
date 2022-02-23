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
    
    init(type: PokerType, numberOfPlayers: Int) {
        self.type = type
        let players = (0..<numberOfPlayers).map { _ in Player()
        }
        let dealer = Dealer(deck: CardDeck(), players: players)
        self.dealer = dealer
    }
    
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
    var cards: [Card] = []
    
    static var candidates = [
        "Eddy", "Jason", "Chez", "Dale", "Selina", "Jed", "Jee", "Ebony", "Sol", "Gucci"
    ]
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = Player.candidates.randomElement()!
        self.cards = []
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

enum PokerGameError: Error {
    case tooManyPlayer
}
