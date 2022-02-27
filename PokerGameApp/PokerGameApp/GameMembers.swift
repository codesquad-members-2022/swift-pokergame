//
//  PokerParticipants.swift
//  PokerGameApp
//
//  Created by 백상휘 on 2022/02/27.
//

import Foundation

class GameMembers {
    
    var personCount: Int
    let gameType: TypeOfGame
    
    var members = [Participant]()
    
    init(numberOf person: Int, gameType type: TypeOfGame) {
        self.personCount = person
        self.gameType = type
        
        for _ in 0..<personCount {
            members.append(Participant())
        }
    }
    
    func sayMyNames() -> [String] {
        members.map({$0.name})
    }
}

extension GameMembers: CustomStringConvertible {
    
}
