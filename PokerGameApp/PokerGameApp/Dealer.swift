//
//  Dealer.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/27.
//

import Foundation

class Dealer {
    
    var deck: CardDeck // 덱은 카드의 저장소처럼 작동한다. 실제 딜러가 가질 수 있는 카드는 cards 배열에 저장된다.
    
    let shuffleSkill = ShuffleAlgorithm<Card>()
    let gameType: TypeOfGame
    var cards = [Card]()
    
    var shuffleType: CardShuffleAlgo = .FisherYates
    
    init(deck: CardDeck, gameType type: TypeOfGame) {
        self.deck = deck
        self.gameType = type
    }
    
    func draw() -> Card? {
        deck.removeOne()
    }
    
    func shuffle() {
        switch shuffleType {
        case .FisherYates:
            shuffleSkill.fisherYatesAlgorithm(at: &cards)
        case .Knuth:
            shuffleSkill.knuthAlgorithm(at: &cards)
        case .Ordinary:
            shuffleSkill.ordinaryCardShuffle(at: &cards)
        }
    }
    
    func isFull(count: Int) -> Bool {
        deck.count() >= count
    }
}
