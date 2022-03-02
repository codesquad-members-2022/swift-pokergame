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
  
    private let dealer: Dealer
    private let players: Players
    private let stud: Stud
    private let numberOfPlayer: NumberOfPlayer
    var playerCount: Int {
        return players.playerCount
    }
    
    func playGame() {
        dealer.handOutCards(stud: stud)
    }
    
    init(stud: Stud, numberOfPlayer: NumberOfPlayer) {
        dealer = Dealer()
        players = Players(numberOfPlayer: numberOfPlayer)
        self.stud = stud
        self.numberOfPlayer = numberOfPlayer
    }
}
