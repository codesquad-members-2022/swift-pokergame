//
//  CardDeck.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/23.
//

import Foundation

class CardDeck {
    private(set) var cards = [Card]()
    
    init() {
        self.cards = Card.all()
    }
    
    func count() -> Int {
        return self.cards.count
    }
    
    func removeOne() -> Card? {
        if self.cards.isEmpty {
            return nil
        }
        return self.cards.removeLast()
    }
    
    func reset() {
        cards = Card.all()
    }
    
    func shuffle() {
        self.cards = shuffleFisherYates(self.cards)
    }
    
    private func shuffleFisherYates<T>(_ array: [T]) -> [T] {
        var origin = array
        var result = [T]()
        while(!origin.isEmpty) {
            let randomIndex = Int.random(in: 0..<origin.count)
            let removedElement = origin.remove(at: randomIndex)
            result.append(removedElement)
        }
        return result
    }
}
