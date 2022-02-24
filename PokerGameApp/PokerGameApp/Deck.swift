//
//  Deck.swift
//  PokerGameApp
//
//  Created by Bibi on 2022/02/24.
//

import Foundation

struct Deck {
    // 52장의 카드
    
    private var cardDeck = Array<Card>()
    private let cardNumber = 13
    
    init() {
        reset()
    }
    
    func count() {
        // 갖고 있는 카드 갯수 반환
    }
    
    func shuffle() {
        // 전체 카드를 랜덤하게 섞음
    }
    
    func removeOne() {
        // 카드 인스턴스 중 하나를 반환하고 목록에서 삭제
    }
    
    mutating func reset() {
        // 처음처럼 모든 카드를 다시 채워넣음
        self.cardDeck = Array<Card>()
        for i in 1...cardNumber {
            self.cardDeck.append(Card(shape: .spades, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .diamonds, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .hearts, number: Card.Number.init(rawValue: i) ?? .ace))
            self.cardDeck.append(Card(shape: .clubs, number: Card.Number.init(rawValue: i) ?? .ace))
        }
    }
}
