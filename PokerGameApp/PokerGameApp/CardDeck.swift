//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/24.
//

import Foundation

typealias CardShuffleAlgo = CardDeck.ShuffleAlgorithms

struct CardDeck {
    
    private var deck: [Card]
    
    init(_ type: CardFactory.Init) {
        switch type {
        case .random:
            deck = [CardFactory.randomCard()]
        case .deck:
            deck = CardFactory.deckOfCard()
        }
    }
    
    func count() -> Int {
        return deck.count
    }
    
    mutating func shuffle(use method: (inout [Card])->Void) {
        method(&deck)
    }
    
    mutating func removeOne() -> Card? {
        guard let card = deck.last else { return nil }
        deck.removeLast()
        return card
    }
    
    mutating func reset() {
        deck = CardFactory.deckOfCard()
    }
    
    enum ShuffleAlgorithms: String, CaseIterable {
        case FisherYates = "FisherYates"
        case Knuth = "Knuth"
        case Ordinary = "Ordinary"
    }
}
