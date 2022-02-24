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
    
    init(numberOfGamblers: Int, gameRule: GameRule) {
        var nameArray = ["Sol", "Jee", "Eddy", "Jed", "Dale"]
        var gamblers = [Gambler]()
        for _ in 0..<numberOfGamblers{
            let pickedIndex = (0..<nameArray.count).randomElement() ?? 0
            let pickedName = nameArray.remove(at: pickedIndex)
            let newGambler = Gambler(name: pickedName)
            gamblers.append(newGambler)
        }
        
        self.dealer = Dealer()
        self.gamblers = gamblers
        self.gameRule = gameRule
    }
    
    private func distributeCard() {
        guard dealer.countRemainingCards >= gameRule.numberOfCard * (gamblers.count + 1) else { return }
        dealer.shuffleWholeDeck()
        for _ in 0..<gameRule.numberOfCard {
            for index in 0..<gamblers.count {
                guard let newCard = self.dealer.pickCard() else { return }
                gamblers[index].receiveCard(newCard)
            }
            guard let newCard = self.dealer.pickCard() else { return }
            dealer.receiveCard(newCard)
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
