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
    
    var allPlayers: [Playable] {
        players + [dealer]
    }
    
    func start() throws {
        for player in allPlayers {
            do {
                let dealt = try dealer.deal(numOfcards: type.rawValue)
                player.receive(cards: dealt)
            } catch {
                print(error)
            }
        }
    }
}

enum PokerType: Int {
    case fiveStud = 5
    case sevenStud = 7
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
    
    init(deck: CardDeck, cards: [Card] = []) {
        self.deck = deck
        self.cards = cards
        self.deck.shuffle()
    }
    
    func deal(numOfcards: Int) throws -> [Card] {
        var cards = [Card]()
        for _ in 0..<numOfcards {
            guard let drawn = deck.draw() else { throw PokerGameError.tooManyPlayer }
            cards.append(drawn)
        }
        return cards
    }
    
    func receive(cards: [Card]) {
        self.cards += cards
    }
}

enum PokerGameError: Error {
    case tooManyPlayer
}
