//
//  PlayersFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

import Foundation

struct Game {
    
    private var players:[Player]
    private var playersRanks:[RankOfHands] { players.map {  $0.checkRankOfHand()  }  }
    private var playerNames:[String] { players.map { $0.name } }
    private var playerCards:[[Card]] { players.map{ $0.cards } }
    
    init(players:[Player]) {
        self.players = players
    }
    
    func results() -> String{
        let playerResults = zip(self.playerNames, self.playersRanks)
        var stringResults:String = "게임결과 \n"
        
        for (name,rank) in playerResults {
            stringResults.append("이름:\(name) 결과:\(rank) \n")
        }

        return stringResults
    }
    
    func showPlayerCards() -> String {
        let playerCards = zip(self.playerNames, self.playerCards)
        var stringResult:String = "카드결과 \n"
        
        for (name,cards) in playerCards {
            stringResult.append("이름:\(name) 결과:\(cards) \n")
        }
        
        return stringResult
    }
}
