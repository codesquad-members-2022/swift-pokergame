//
//  Dealer.swift
//  PokerGameApp
//
//  Created by jsj on 2022/02/24.
//

import Foundation

class Dealer: Player {
    private let cardDeck = CardDeck()
    private let stud: Stud
    
    init(name: String, stud: Stud) {
        self.stud = stud
        super.init(name: name)
    }
    
    func distributeCard(to players: [Player]) -> [Player] {
        cardDeck.shuffle()
        
        //1. 게임딜러도 카드를 가진다
        for _ in 0..<stud.rawValue {
            guard let removedCard = cardDeck.removeOne() else {
                continue
            }
            self.handOver(cards: [removedCard])
        }
        //2. 참가자들에게 카드 분배
        var result = [Player]()
        for player in players {
            for _ in 0..<stud.rawValue {
                guard let removedCard = cardDeck.removeOne() else {
                    continue
                }
                player.handOver(cards: [removedCard])
            }
            result.append(player)
        }
        return result
    }
}
