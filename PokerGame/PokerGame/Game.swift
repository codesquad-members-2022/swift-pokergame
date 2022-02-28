//
//  PlayersFactory.swift
//  PokerGame
//
//  Created by 박진섭 on 2022/02/25.
//

import Foundation

class Game:CustomStringConvertible {
    
    var description: String {
        "\(results())\n\(showPlayerCards())"
    }
    
    private var players:[Player]
    private var playersRanks:[RankOfHands] { players.map {  $0.checkRankOfHand()  }  }
    private var playerNames:[String] { players.map { $0.name } }
    private var playerCards:[[Card]] { players.map{ $0.cards } }
    
    init(players:[Player]) {
        self.players = players
    }
    
    //플레이어들의 이름과 카드의 족보를 비교해 승자를 가릴 수 있게 합니다.
    func results() -> String{
        if isOver() {
            let playerResults = zip(self.playerNames, self.playersRanks)
            var stringResults:String = "게임결과 \n"
            
            for (name,rank) in playerResults {
                stringResults.append("이름:\(name) 결과:\(rank) \n")
            }
            
            return stringResults
            
        }   else { return "카드가 더이상 없습니다." }
    }
    
    //플레이어들이 뽑은 카드를 전부 보여줍니다.
    func showPlayerCards() -> String {
        let playerCards = zip(self.playerNames, self.playerCards)
        var stringResult:String = "카드결과 \n"
        
        for (name,cards) in playerCards {
            stringResult.append("이름:\(name) 결과:\(cards) \n")
        }
        
        return stringResult
    }
    
    //player들이 가지고 있는 카드의 갯수가 모두 5 혹은 7이 아니라면 카드가 부족해서 못나누어준 경우이므로 게임을 종료합니다.
    private func isOver() -> Bool{
        let playerCardsCount = playerCards.map { $0.count }
        let isOver = playerCardsCount.allSatisfy { $0 == 5 || $0 == 7 }
        return isOver
    }
    
    
}
