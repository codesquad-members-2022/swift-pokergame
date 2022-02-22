//
//  CardDeck.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/21.
//

import Foundation

///카드 덱 클래스
///덱은 초기화 시 CardData를 52장을 가지고 있으며,
///덱의 카드의 수가 줄거나, 셔플, 한장빼기등 CardData를 관리함
///변형이 일어나는 데이터이기 때문에 클래스로 제작
class CardDeck: CustomStringConvertible {
    
    public private(set) var deck: [Card] = []
    
    var description: String {
        let deckData = String(deck.reduce(""){ $0 + "\($1), "}.dropLast(2))
        return "[\(deckData)]\ncount: \(deck.count)"
    }
    
    var count: Int {
        deck.count
    }
    
    var isEmpty: Bool {
        deck.isEmpty
    }
    
    init() {
        reset()
    }
    
    func shuffle() {
        (0..<deck.count).forEach { index in
            let randomIndex = Int.random(in: index..<deck.count)
            let targetCard = deck[index]
            let randomCard = deck[randomIndex]
            deck[index] = randomCard
            deck[randomIndex] = targetCard
        }
    }
    
    func removeOne() -> Card? {
        if isEmpty {
            return nil
        }
        let randomIndex = Int.random(in: 0..<deck.count)
        return deck.remove(at: randomIndex)
    }
    
    func reset() {
        deck = Card.Pattern.allCases.reduce([]) { resultDeck, pattern in
            resultDeck + Card.Number.allCases.map {
                Card(pattern: pattern, number: $0)
            }
        }
    }
}
