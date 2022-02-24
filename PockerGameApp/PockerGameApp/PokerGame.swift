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
        
        func getRandomCombinations(pick: Int, from array: [String]) -> [String] {
            guard !array.isEmpty, pick > 0 else { return [] }
            
            let roll = Int.random(in: 0..<array.count)
            let prefix = array[roll]
            
            if pick == 1 { return [prefix] }
            let combinationOfRemains = getRandomCombinations(pick: pick-1, from: Array(array.dropFirst(roll)))
            return [prefix] + combinationOfRemains
        }
        
        let names = getRandomCombinations(pick: numberOfPlayers, from: Player.candidates)
        
        let players = names.map { name in Player(name: name) }
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
