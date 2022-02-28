//
//  GameType.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/26.
//

enum GameType {
    case fiveStud
    case sevenStud
    
    var dealCount:Int {
        switch self {
        case .fiveStud:
            return 5
        case .sevenStud:
            return 7
        }
    }
}
