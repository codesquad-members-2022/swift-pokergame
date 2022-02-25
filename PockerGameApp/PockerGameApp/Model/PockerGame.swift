//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class PokerGame {
    enum StudRule {
        
        case sevenCardStud
        case fiveCardStud
        
        var numberOfCard: Int {
            switch self {
            case .sevenCardStud: return 7
            case .fiveCardStud: return 5
            }
        }
    }
    
    let dealer: Dealer
    let gamblers: Gamblers
    let gameRule: StudRule
    
    init(numberOfGamblers: numberOfGamblers, gameRule: StudRule) {
        
        self.dealer = Dealer()
        self.gamblers = Gamblers.init(with: numberOfGamblers)
        self.gameRule = gameRule
    }
    
    public func distributeCard() {
        dealer.distributeCard(to: gamblers, in: gameRule)
    }
}
