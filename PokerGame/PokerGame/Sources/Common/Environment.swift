//
//  Environment.swift
//  PokerGame
//
//  Created by seongha shin on 2022/02/22.
//

import Foundation

public enum Environment {
    enum Player {
        static let limitCount = 4
        static let defaultCount = 4
    }
    
    enum Poker {
        static let defaultType = PokerGame.PokerType.sevenCard        
    }
}
