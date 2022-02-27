//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/27.
//

import Foundation

typealias CardShuffleAlgo = Dealer.CardAlgorithm

class Dealer {
    
    var deck: CardDeck // 덱은 카드의 저장소처럼 작동한다. 실제 딜러가 가질 수 있는 카드는 cards 배열에 저장된다.
    
    let shuffleSkill = ShuffleAlgorithm<Card>()
    let gameType: TypeOfGame
    var cards = [Card]()
    
    var shuffleType: CardShuffleAlgo = .FisherYates
    var shuffleMethod: ((inout [Card]) -> Void) {
        switch shuffleType {
        case .FisherYates:
            return shuffleSkill.fisherYatesAlgorithm
        case .Knuth:
            return shuffleSkill.knuthAlgorithm
        case .Ordinary:
            return shuffleSkill.ordinaryCardShuffle
        }
    }
    
    init(deck: CardDeck, gameType type: TypeOfGame) {
        self.deck = deck
        self.gameType = type
    }
    
    func draw() -> Card? {
        deck.removeOne()
    }
    
    func shuffle() {
        shuffleMethod(&cards)
    }
    
    func isFull(count: Int) -> Bool {
        deck.count() >= count
    }
    
    func setCard(_ card: Card) {
        cards.append(card)
    }
    
    enum CardAlgorithm: String, CaseIterable {
        case FisherYates = "FisherYates"
        case Knuth = "Knuth"
        case Ordinary = "Ordinary"
    }
}
