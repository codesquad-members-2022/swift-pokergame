//
//  Dealer.swift
//  PokerGame
//
//  Created by Jihee hwang on 2022/02/24.
//

import Foundation

/* 5장 혹은 7장씩 카드를 나눠줌
 자신을 포함, 참가자 전원에게 카드를 나눠줘야한다.
 
 1. 게임 방식
 2. 카드 나눠주는
 
 카드덱 인스턴스와, 참가자 인스턴스가 존재해야겠군
 
 */

struct PokerGame {
    
    private var player: Player
    private var cardDeck: CardDeck
    private var playerCard: [CardDeck]
    private var stud: Stud
    
    enum Stud: Int, CaseIterable {
        case five = 5
        case seven = 7
    }
    
    init(stud: Stud) {
        self.stud = stud
        self.player = Player()
        self.cardDeck = CardDeck()
        self.playerCard = [CardDeck()]
        
    }
        
}

extension PokerGame: CustomStringConvertible {
    var description: String {
        
        return ""
    }
}


//for i in 0..<player.count {
//    for j in 0..<stud.rawValue {
//        playerCard.append(cardDeck)
//    }
//}
