//
//  GameType.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/26.
//

enum GameType:Int {
    case fiveStud = 5
    case sevenStud = 7
    
    var dealCount:Int {
        self.rawValue
    }
    
}
