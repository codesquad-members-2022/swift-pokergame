//
//  Dealer.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class Dealer {
    private let cardDeck = CardDeck()
    private let stud: Stud
    
    private var cards = [Card]()
    private let name: String = "딜러"
    
    init(stud: Stud) {
        self.stud = stud
    }
    
    func distributeCard(to players: [Player]) -> [Player] {
        cardDeck.shuffle()
        
        //1. 게임딜러도 카드를 가진다
        for _ in 0..<stud.rawValue {
            guard let removedCard = cardDeck.removeOne() else {
                continue
            }
            self.cards.append(removedCard)
        }
        //2. 참가자들에게 카드 분배
        var result = [Player]()
        for player in players {
            var p = player
            for _ in 0..<stud.rawValue {
                guard let removedCard = cardDeck.removeOne() else {
                    continue
                }
                p.handOver(cards: [removedCard])
            }
            result.append(p)
        }
        return result
    }
}
