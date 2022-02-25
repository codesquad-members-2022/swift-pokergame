//
//  PokerGame.swift
//  PokerGame
//
//  Created by 김상혁 on 2022/02/25.
//

import Foundation

struct PokerGame {
    
    enum Stud: Int {
        case five
        case seven
        
        var cardCountForGame: Int {
            switch self {
            case .five:
                return 5
            case .seven:
                return 7
            }
        }
    }
    
    enum PlayerCount: Int {
        case one = 1
        case two
        case three
        case four
        
        var excludeDealer: Int {
            return self.rawValue
        }
    }
}
