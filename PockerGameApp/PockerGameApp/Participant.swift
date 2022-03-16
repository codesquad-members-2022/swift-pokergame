//
//  Participant.swift
//  PockerGameApp
//
//  Created by Jason on 2022/03/15.
//

import Foundation

//MARK: 참가자(Participant)는 포커게임에 참가하는 인원이 누군지만 확인하는 객체 - Edit End -
struct Participants {
    
    var players: [Playable]
    var count: Int {
        return players.count
    }
    
    init(playerCount:Int, dealer:Dealer) {
        // Player 카드 및 이름 배열에 담기 -> 참가자 이름 변경 요망
        self.players = (0..<playerCount).map{ number in Player(name:"Player\(number+1)") }
        // Dealer 카드 및 이름 배열에 담기
        self.players.append(dealer)
    }
    
}
