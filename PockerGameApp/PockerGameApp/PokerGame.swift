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
    
    init(type: PokerType, numberOfPlayers: Int) throws {
        self.type = type
        guard (0...4).contains(numberOfPlayers) else {
            throw PokerGameError.tooManyPlayer
        }
        
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

enum PokerGameError: Error {
    case tooManyPlayer
    case outOfCards
}
