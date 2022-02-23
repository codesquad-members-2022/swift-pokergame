//
//  PockerGame.swift
//  PockerGameApp
//
//  Created by 김한솔 on 2022/02/23.
//

import Foundation

class PokerGame {
    
    let dealer: Dealer
    let gamblers: [Gambler]
    let gameRule: GameRule
    
    init(numberOfGamblers: Int) {
        var nameArray = ["Sol", "Jee", "Eddy", "Jed", "Dale"]
        var gamblers = [Gambler]()
        for _ in 0..<numberOfGamblers{
            let newGambler = Gambler(name: nameArray.remove(at: (0..<nameArray.count).randomElement() ?? 0))
            gamblers.append(newGambler)
        }
        
        self.dealer = Dealer()
        self.gamblers = gamblers
        self.gameRule = .sevenCardStud
    }
    
    func gameScenario() {
        distributeCard()
    }
    
    public func distributeCard() {
        for _ in 0..<gameRule.numberOfCard {
            for index in 0..<gamblers.count {
                gamblers[index].getCard(self.dealer.pickCard()!)
            }
            dealer.getCard(self.dealer.pickCard()!)
        }
    }
}

enum GameRule {
    
    case sevenCardStud
    case fiveCardStud
    
    var numberOfCard: Int {
        switch self {
        case .sevenCardStud: return 7
        case .fiveCardStud: return 5
        }
    }
}
